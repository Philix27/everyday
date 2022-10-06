import 'package:everyday/controller/all_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:everyday/core/auth_switch.dart';
import 'package:everyday/core/theme/theme_dark.dart';
import 'package:everyday/core/theme/theme_light.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'everydayap',
      initialRoute: "/",
      home: AuthSwitch(),
      theme: LIGHT_THEME,
      //! Remove codes below
      darkTheme: DARK_THEME,
      // themeMode: ThemeService().getThemeMode(),
      themeMode: ThemeMode.system,
    );
  }
}
