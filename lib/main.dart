import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:everyday/core/app_widget.dart';
import 'package:everyday/models/article.dart';
import 'package:everyday/models/pepNote.dart';
import 'package:everyday/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final Directory appDocumentDirectory =
      await getApplicationDocumentsDirectory();

//? Hive
//? Register Hive Adpters
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(AppUserAdapter());
  Hive.registerAdapter(PepNoteAdapter());

  //? Open All HiveBoxes
  await Hive.openBox<Article>("bookmarks");
  await Hive.openBox<AppUser>("userInfo");
  await Hive.openBox<PepNote>("pepNotes");
  await Hive.openBox<int>("Settings");

//? SystemChrome
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[200],
    // statusBarColor: Color(0xFF087040),
    // statusBarIconBrightness: Brightness.dark,

    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));

  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  var lili = <String>[];
  // lili.any();
  runApp(const AppWidget());
}
