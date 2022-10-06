import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everyday/core/global_variables.dart';
import 'package:everyday/view/widgets/widgets.dart';
// import 'package:timeago/timeago.dart';

class SliderModel {
  final String details;
  final String docID;
  final String title;
  final String authorID;
  final String timePosted;
  final bool isImage;
  final String imageUrl;
  final Color colorCode;

  SliderModel({
    required this.details,
    required this.docID,
    required this.title,
    required this.authorID,
    required this.timePosted,
    required this.imageUrl,
    required this.colorCode,
    required this.isImage,
  });

  factory SliderModel.fromMap(Map<String, dynamic> map) {
    final tempTime = map['timePosted'] as Timestamp;
    final String time = tempTime.toDate().toString();
    // final String time = format(tempTime.toDate()).toString();
    final String colCode = map['colorCode'].toString();
    final Color color = Color(int.parse(colCode));
    return SliderModel(
      timePosted: time,
      title: map['title'].toString(),
      docID: map['docID'].toString(),
      isImage: map['isImage'] as bool,
      authorID: map['authorID'].toString(),
      colorCode: color,
      imageUrl: map['imageUrl'].toString(),
      details: map['details'].toString(),
    );
  }

  static void deleteItem(String id) => MyGlobals.homeBannerCollection
      .doc(id)
      .delete()
      .then((value) => MyWidgets.snackbar(title: "Deleted"));
}
