// import 'package:everyday/controller/hive_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';

// class ThemeService {
//   final HiveController _hiveController =
//       Get.put<HiveController>(HiveController());
//   // final _getStorage = GetStorage();
//   // final storageKey = "isDarkMode";

//   bool isSavedDarkMode() =>
//       _hiveController.themeBox.get('theme') as bool ?? false;

//   ThemeMode getThemeMode() =>
//       isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;

//   void saveThemeMode({bool isDarkMode}) {
//     // _getStorage.write(storageKey, isDarkMode);

//     _hiveController.themeBox.put('theme', isDarkMode);
//   }

//   void changeThemeMode() {
//     Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
//     saveThemeMode(isDarkMode: !isSavedDarkMode());
//   }

//   void makeDark() async {
//     Get.changeThemeMode(ThemeMode.dark);
//     saveThemeMode(isDarkMode: true);
//   }

//   void makeLight() async {
//     Get.changeThemeMode(ThemeMode.light);
//     saveThemeMode(isDarkMode: false);
//   }
// }
