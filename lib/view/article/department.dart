part of 'index.dart';

class Department {
  final String title;
  final String img;

  Department({required this.title, required this.img});
  factory Department.fromMap(Map<String, dynamic> map) {
    // factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      img: map['img'].toString(),
      title: map['title'].toString(),
    );
  }
}
