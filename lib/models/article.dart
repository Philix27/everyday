import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 0)
class Article extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String articleContent;
  @HiveField(3)
  final List<String> tags;
  @HiveField(4)
  final List<String> groups;
  @HiveField(5)
  final String imageUrl;

  Article({
    required this.id,
    required this.title,
    required this.articleContent,
    required this.tags,
    required this.groups,
    required this.imageUrl,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    // factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['_id'].toString(),
      title: map['title'].toString(),
      imageUrl: map['imageUrl'].toString(),
      articleContent: map['content'].toString(),
      groups: List<String>.from(map['relatedArticlesID'] as Iterable<dynamic>),
      tags: List<String>.from(map['keywords'] as Iterable<dynamic>),
    );
  }
}
