import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Color _baseColor = const Color(0xFF06748F);
Color _baseColor = Color.fromARGB(255, 212, 2, 2);
// Color _bgColor = Colors.grey[200]!;
Color _bgColor = const Color(0xFFeff4f9);

// ignore: non_constant_identifier_names
ThemeData LIGHT_THEME = ThemeData.light().copyWith(
  brightness: Brightness.light,
  canvasColor: Colors.white,
  primaryColorLight: Colors.white,
  primaryColor: _baseColor,
  scaffoldBackgroundColor: _bgColor,
  backgroundColor: _bgColor,
  iconTheme: IconThemeData(color: _baseColor),
  //! Work on below
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(20),
    fillColor: Colors.white,
    focusColor: Colors.white,
    isCollapsed: true,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  ),

  appBarTheme: AppBarTheme(
    elevation: 0.0,
    iconTheme: IconThemeData(color: _baseColor),
    actionsIconTheme: IconThemeData(
      color: _baseColor,
    ),
    backgroundColor: _bgColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      // statusBarColor: Color(0xFF087040),
      statusBarColor: _bgColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: _baseColor,
  ),

  //Regular TextTheme
  textTheme: TextTheme(
    headline1: TextStyle(
      color: _baseColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(
      color: _baseColor,
      fontSize: 14,
    ),
    headline3: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headline4: const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    bodyText1: const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    bodyText2: const TextStyle(
      color: Colors.black54,
      fontSize: 14,
    ),
    subtitle1: const TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: _baseColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);
