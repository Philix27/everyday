import 'dart:convert';

class ArticlesCategory {
  final String imgUrl;
  final String name;
  final String department;
  ArticlesCategory({
    required this.imgUrl,
    required this.name,
    required this.department,
  });

  ArticlesCategory copyWith({
    String? imgUrl,
    String? name,
    String? department,
  }) {
    return ArticlesCategory(
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'title': name,
      'department': department,
    };
  }

  factory ArticlesCategory.fromMap(Map<String, dynamic> map) {
    return ArticlesCategory(
      imgUrl: map['imageUrl'],
      name: map['title'],
      department: map['department'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticlesCategory.fromJson(String source) =>
      ArticlesCategory.fromMap(json.decode(source));

  @override
  String toString() => 'ArticlesCategory(imgUrl: $imgUrl, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArticlesCategory &&
        other.imgUrl == imgUrl &&
        other.name == name;
  }

  @override
  int get hashCode => imgUrl.hashCode ^ name.hashCode;
}
