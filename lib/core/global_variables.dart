import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class MyGlobals {
  static final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  static final CollectionReference suggestionCollection =
      FirebaseFirestore.instance.collection('suggestions');
  static final CollectionReference homeBannerCollection =
      FirebaseFirestore.instance.collection('HomeBanner');
  static final CollectionReference notesSliderCollection =
      FirebaseFirestore.instance.collection('NotesSlider');
  static final CollectionReference invoiceCollection =
      FirebaseFirestore.instance.collection('Invoice');
  static final CollectionReference pepNotes =
      FirebaseFirestore.instance.collection('pepNotes');
  static final CollectionReference pricing =
      FirebaseFirestore.instance.collection('pricing');
  static final CollectionReference notesDepartment =
      FirebaseFirestore.instance.collection('notesDepartment');
  static final CollectionReference newsCollection =
      FirebaseFirestore.instance.collection('news');

//Firebase instances
//! Watch this
  static final User? firebaseCurrentUser = FirebaseAuth.instance.currentUser;
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// AppUser appUser;

  static String phoneNumber = '';

  static final RegExp _regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  static String moneyFormater(int value) =>
      "₦$value".replaceAllMapped(_regExp, (Match m) => '${m[1]},');

  static List<Widget> productsCategoryList = [];

//? Pricing
  static String publicKey = "pk_live_bcddf6973cdcbd5811ae519ab726adb9cce4091f";
  static int? bannerCount;

  static String timestampDateStringFormatter(Timestamp timestamp) =>
      DateFormat.yMMMMd().format(timestamp.toDate());

  static String dateFromString(String time) =>
      DateFormat.yMMMMd().format(DateTime.parse(time));

  bool hideBottomNavbar = false;
}
