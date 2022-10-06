import 'package:everyday/api/user.dart';
import 'package:everyday/controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:everyday/controller/hive_controller.dart';
import 'package:everyday/view/widgets/widgets.dart';
import 'package:everyday/models/user.dart';

enum AUTHSTATE {
  none,
  loading,
  hasAnAccount,
  newUser,
}

class AuthController extends GetxController {
  final UserController _userController =
      Get.put<UserController>(UserController(), permanent: true);
  final gogleSignInAccount = Rx<GoogleSignInAccount?>(null);
  final firebaseUser = Rx<User?>(null);
  Rx<bool> isSigningIn = Rx(false);
  Rx<AUTHSTATE> authState = Rx<AUTHSTATE>(AUTHSTATE.none);
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  // late AppUser userObj;
  String? get user => firebaseUser.value?.email;
  late AppUser userM;
  final appUser = Rx<AppUser?>(null);
  late UserApi _api;

  @override
  void onInit() {
    super.onInit();
    _api = UserApi();
    checkIfAlreadyLoggedIn();
    firebaseUser.bindStream(auth.authStateChanges());
  }

  Future<void> postDetails() async {
    authState.value = AUTHSTATE.hasAnAccount;
  }

  Future<void> checkIfAlreadyLoggedIn() async {
    AppUser u = HiveBoxes.getUserInfo();
    if (u.email != '') {
      authState.value = AUTHSTATE.hasAnAccount;
      userM = u;
    }
  }

  Future<void> login() async {
    authState.value = AUTHSTATE.loading;

    try {
      gogleSignInAccount.value = await googleSignIn.signIn();

      bool isSignedIn = await googleSignIn.isSignedIn();

      if (gogleSignInAccount.value != null && isSignedIn) {
        final googleAuth = await gogleSignInAccount.value!.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential _userCredential =
            await auth.signInWithCredential(credential);
        // TODO: Store in hive

        appUser.value = AppUser(
          uid: firebaseUser.value!.uid,
          email: firebaseUser.value!.email!,
          username: firebaseUser.value!.displayName!,
          dateJoined: DateTime.now().toString(),
          accessToken: _userCredential.credential!.token!.toString(),
        );
        await HiveBoxes.setUserInfo(appUser.value!);
        userM = appUser.value!;
        authState.value = AUTHSTATE.hasAnAccount;

        if (_userCredential.additionalUserInfo!.isNewUser) {
          authState.value = AUTHSTATE.newUser;

          final Map<String, dynamic> _map = {
            'uid': auth.currentUser!.uid,
            'userName': _userCredential.additionalUserInfo!.username,
            'email': auth.currentUser!.email,
            'dateJoined': DateTime.now().toString(),
            'accessToken': _userCredential.credential!.token.toString(),
          };

          // await _api.postNewUser(_map);
        } else {
          authState.value = AUTHSTATE.hasAnAccount;
          MyWidgets.toast(
              'Welcome back ${gogleSignInAccount.value!.displayName}');
        }
      }
    } on PlatformException {
      authState.value = AUTHSTATE.none;
      print("D450 - Exception - E cast");
      MyWidgets.snackbar(
        title: "Opps, an error occured - Platform Exception",
        message: "Check your connection and try again",
        bgColor: Styles.warningColor,
      );
    } catch (error) {
      print("D450 - Could not sign in");
      authState.value = AUTHSTATE.none;
      MyWidgets.errorSnackbar(title: error.toString());
    }
  }

  // Future<void> createLocalUserObject() async {}

  Future<void> logout() async {
    authState.value = AUTHSTATE.none;
    try {
      await googleSignIn.disconnect();
      await googleSignIn.signOut();
    } catch (error) {
      MyWidgets.errorSnackbar(title: error.toString());
    }
    await auth.signOut();
    await HiveBoxes.bookmarkBox.clear();
    await HiveBoxes.userInfo.clear();
  }
}
