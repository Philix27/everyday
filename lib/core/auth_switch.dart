import 'package:everyday/core/app_scaffold.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:everyday/controller/auth_controller.dart';
import 'package:everyday/view/auth/form.dart';
import 'package:everyday/view/auth/sign_in_page.dart';
import 'package:everyday/view/auth/view.dart';

class AuthSwitch extends GetWidget<AuthController> {
  AuthSwitch({Key? key}) : super(key: key);

  final AuthController authController =
      Get.put<AuthController>(AuthController());

  @override
  Widget build(BuildContext context) {
    //! Assign Themes
    Styles.primaryColor = Theme.of(context).primaryColor;
    Styles.primaryColorLight = Theme.of(context).primaryColorLight;
    Styles.accentColor = Theme.of(context).accentColor;
    Styles.cardColor = Theme.of(context).cardColor;
    Styles.canvasColor = Theme.of(context).canvasColor;
    Styles.scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    Styles.backgroundColor = Theme.of(context).backgroundColor;
    Styles.bodyText1 = Theme.of(context).textTheme.bodyText1;
    Styles.bodyText2 = Theme.of(context).textTheme.bodyText2;
    Styles.subtitle1 = Theme.of(context).textTheme.subtitle1;
    Styles.subtitle2 = Theme.of(context).textTheme.subtitle2;
    Styles.headlineText1 = Theme.of(context).textTheme.headline1;
    Styles.headlineText2 = Theme.of(context).textTheme.headline2;
    Styles.headlineText3 = Theme.of(context).textTheme.headline3;
    Styles.headlineText4 = Theme.of(context).textTheme.headline4;

    return Obx(() {
      if (controller.authState.value == AUTHSTATE.loading) return const View();
      if (controller.authState.value == AUTHSTATE.hasAnAccount)
        return const AppScaffold();
      if (controller.authState.value == AUTHSTATE.newUser)
        return SignUpFormPage();
      return const SignInPage();
    });
    // return const AppScaffold();
  }
}
