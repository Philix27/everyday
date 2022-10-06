import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class AppUser extends HiveObject {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String dateJoined;
  @HiveField(4)
  final String accessToken;

  AppUser({
    required this.uid,
    required this.username,
    required this.email,
    required this.accessToken,
    required this.dateJoined,
  });

  factory AppUser.fromMap(Map<String, dynamic> doc) {
    return AppUser(
      uid: doc['uid'].toString(), //? => Gotten
      email: doc['email'].toString(),
      username: doc['username'].toString(),
      dateJoined: doc['dateJoined'].toString(),
      accessToken: doc['accessToken'].toString(),
    );
  }
}
