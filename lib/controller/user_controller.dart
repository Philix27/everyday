import 'package:everyday/api/user.dart';
import 'package:everyday/core/global_variables.dart';
import 'package:get/get.dart';
import 'package:everyday/models/user.dart';
import 'package:everyday/view/widgets/widgets.dart';

class UserController extends GetxController {
  final UserApi _api = UserApi();
  // static late AppUser user;
  // @override
  // void onInit() {
  //   super.onInit();
  //   userB.bindStream(userStream());
  // }

  Future<AppUser> fetchUser(String uid) async {
    Map<String, dynamic> doc = await _api.getUser(uid);
    return AppUser.fromMap(doc);
  }

  Future<void> createNewUser({
    required DateTime? dateRegistered,
    required String? email,
    required int? token,
    required String? username,
    required String? uid,
  }) async {
    final Map<String, dynamic> _map = {
      'uid': MyGlobals.firebaseCurrentUser!.uid,
      'userName': username,
      'email': email,
      'dateJoined': dateRegistered.toString(),
      'accessToken': token.toString(),
    };
    // print(_map);
    await _api.postNewUser(_map).then((isCompleted) {
      if (isCompleted)
        MyWidgets.snackbar(
          title: 'Successful',
          message: 'Registration completed',
        );
    });
  }
}
