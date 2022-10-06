class Blog {
  final String id;
  final String category;
  final String title;
  final String image;
  final String content;
  final String summary;
  // final DateTime timePosted;

  Blog({
    required this.id,
    required this.category,
    required this.title,
    required this.image,
    required this.content,
    required this.summary,
    // required this.timePosted,
  });

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['_id'].toString(),
      title: map['title'].toString(),
      image: map['image'].toString(),
      content: map['content'].toString(),
      summary: map['summary'].toString(),
      category: map['category'].toString(),
      // timePosted: map['timePosted'] as DateTime,
    );
  }
}
