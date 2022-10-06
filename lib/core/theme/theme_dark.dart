import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color _baseColor = const Color(0XFF212331);
Color _bgColor = const Color(0XFF383b50);
Color _accent = const Color(0xFF29c777);
// ignore: non_constant_identifier_names
ThemeData DARK_THEME = ThemeData.dark().copyWith(
  accentColor: _accent,
  primaryColor: _baseColor,
  primaryColorLight: Colors.white,
  cardColor: _baseColor,
  scaffoldBackgroundColor: _bgColor,
  brightness: Brightness.light,
  tabBarTheme: const TabBarTheme(labelColor: Colors.white),
  canvasColor: _baseColor,
  backgroundColor: _bgColor,
  iconTheme: const IconThemeData(color: Colors.white),

  appBarTheme: AppBarTheme(
    elevation: 0.0,
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: _bgColor,
    actionsIconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      // statusBarColor: Colors.grey[200],
      statusBarColor: _bgColor,
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  //! Input
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(20),
    fillColor: _baseColor,
    focusColor: _baseColor,
    isCollapsed: true,
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    // subtitle1: const TextStyle(color: Colors.blueGrey),
  ),
);
