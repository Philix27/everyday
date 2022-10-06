// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:everyday/controller/user_controller.dart';
import 'package:everyday/core/global_variables.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everyday/view/slider/slider_w.dart';
import 'package:everyday/view/subscription/subscription.dart';
import 'package:everyday/view/widgets/loading.dart';
import 'package:everyday/view/widgets/widgets.dart';
import 'package:get/get.dart';

part 'suggestion_page.dart';

class ProfilePage extends GetWidget<AuthController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Center(
              //   child: Card(
              //     color: Styles.canvasColor,
              //     child: SizedBox(
              //       height: 100.0,
              //       width: 100.0,
              //       child: CachedNetworkImage(
              //         imageUrl: controller.gogleSignInAccount.value!.photoUrl!,
              //         fit: BoxFit.cover,
              //         placeholder: (context, url) =>
              //             Loading.spinKitFadingCircle(),
              //         errorWidget: (context, url, error) =>
              //             Loading.spinKitFadingCircle(
              //                 color: Styles.warningColor),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text('Account Info', style: Styles.headlineText1),
              ),
              customListTile(
                icon: CupertinoIcons.person_fill,
                subtitle: "Username",
                text: controller.userM.username,
                onTap: () {},
              ),
              customListTile(
                icon: Icons.email,
                subtitle: "Email address",
                text: controller.userM.email,
                onTap: () {},
              ),
              customListTile(
                icon: Icons.timer,
                text: MyGlobals.dateFromString(controller.userM.dateJoined),
                subtitle: "Date Joined",
                onTap: () {},
              ),
              customListTile(
                icon: Icons.payment,
                text: "Subscription",
                subtitle: "Subscription Plans",
                onTap: () => Get.to(() => const SubscriptionPage()),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text('Others', style: Styles.headlineText1),
              ),
              customListTile(
                icon: Icons.comment,
                subtitle: "Message Us",
                text: "Contact Us",
                onTap: () => Get.to(() => SuggestionPage()),
              ),
              customListTile(
                icon: Icons.web,
                text: "About Us",
                subtitle: "www.everyday.org/about_us",
                onTap: () {},
              ),
              customListTile(
                icon: Icons.lock,
                text: "Privacy Policy",
                subtitle: "www.everyday.org/privacy",
                onTap: () {},
              ),
              customListTile(
                icon: Icons.ads_click,
                text: "Notifications",
                subtitle: "Post on slider",
                onTap: () =>
                    Get.to(AddSlider(ref: MyGlobals.homeBannerCollection)),
              ),
              customListTile(
                icon: Icons.logout,
                subtitle: '',
                text: "Logout",
                onTap: () {
                  controller.logout();
                  MyWidgets.getBack();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customListTile({
  required IconData icon,
  required String text,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      ListTile(
        tileColor: Styles.canvasColor,
        onTap: onTap,
        title: Text(
          text,
          style: Styles.headlineText2!.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(icon, size: 16, color: Styles.primaryColor),
        subtitle: Text(
          subtitle,
          style: Styles.bodyText2!.copyWith(fontSize: 10),
        ),
      ),
      Divider(
        color: Styles.backgroundColor,
        height: 2,
      ),
    ],
  );
}
