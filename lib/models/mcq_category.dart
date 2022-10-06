import 'dart:convert';

class MCQCategory {
  final String imgUrl;
  final String title;
  final String department;
  MCQCategory({
    required this.imgUrl,
    required this.title,
    required this.department,
  });

  MCQCategory copyWith({
    String? imgUrl,
    String? title,
    String? department,
  }) {
    return MCQCategory(
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'title': title,
      'department': department,
    };
  }

  factory MCQCategory.fromMap(Map<String, dynamic> map) {
    return MCQCategory(
      imgUrl: map['imageUrl'],
      title: map['title'],
      department: map['department'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MCQCategory.fromJson(String source) =>
      MCQCategory.fromMap(json.decode(source));

  @override
  String toString() => 'MCQCategory(imgUrl: $imgUrl, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MCQCategory &&
        other.imgUrl == imgUrl &&
        other.title == title;
  }

  @override
  int get hashCode => imgUrl.hashCode ^ title.hashCode;
}
