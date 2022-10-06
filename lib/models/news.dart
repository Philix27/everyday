import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:timeago/timeago.dart';

part 'news.g.dart';

@HiveType(typeId: 1)
class News extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final String content;
  @HiveField(4)
  final List<String> images;

  News({
    required this.title,
    required this.images,
    required this.id,
    required this.time,
    required this.content,
  });

  factory News.fromMap(Map<String, dynamic> doc) {
    final tempTime = doc['timePosted'] as Timestamp;
    final String time = format(tempTime.toDate()).toString();
    return News(
      title: doc['title'].toString(),
      time: time,
      id: doc['id'].toString(),
      content: doc['content'].toString(),
      images: List.from(doc['images'] as Iterable<dynamic>),
    );
  }
}
