import 'package:hive/hive.dart';

part 'pepNote.g.dart';

@HiveType(typeId: 3)
class PepNote extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;

  PepNote({
    required this.id,
    required this.title,
    required this.content,
  });

  factory PepNote.fromMap(Map<String, dynamic> map) {
    return PepNote(
      id: map['_id'].toString(),
      title: map['title'].toString(),
      content: map['content'].toString(),
    );
  }
}
