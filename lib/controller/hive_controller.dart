import 'package:everyday/models/article.dart';
import 'package:hive/hive.dart';
import 'package:everyday/models/pepNote.dart';
import 'package:everyday/models/user.dart';
import 'package:everyday/view/widgets/widgets.dart';

//! HiveType IDs
//! Article = 0
//! AppUser = 1
//! PepNotes = 3
class HiveBoxes {
  static Box<Article> bookmarkBox = Hive.box<Article>('bookmarks');
  static Box<String> completedArticles = Hive.box<String>('completedArticles');
  static Box<AppUser> userInfo = Hive.box<AppUser>('userInfo');
  static Box<PepNote> pepNotesBox = Hive.box<PepNote>('pepNotes');
  static Box<int> fontSize = Hive.box<int>('Settings');

  static addToCompletedArticles(String courseID) => completedArticles
      .put(courseID, courseID)
      .then(((value) => MyWidgets.snackbar(title: 'Completed')));

  static addBookmark(Article course) => bookmarkBox
      .add(course)
      .then(((value) => MyWidgets.snackbar(title: 'Added')));

  static savePepNote(PepNote notes) => pepNotesBox
      .add(notes)
      .then(((value) => MyWidgets.snackbar(title: 'Added')));

//! Set info
  static Future<void> setUserInfo(AppUser user) async => userInfo
      .put('user', user)
      .then(((value) => MyWidgets.toast('Info Saved')));

  static Future<void> setFontSize(int size) async =>
      fontSize.put('fontSize', size);
  // .then(((value) => MyWidgets.toast('Info Saved')));

  // userInfo.add(user).then(((value) => MyWidgets.toast('Info Saved')));

  static getFontSize() async {
    return fontSize.get('fontSize', defaultValue: 1) ?? 1;
  }

  static AppUser getUserInfo() => userInfo.get(
        'user',
        defaultValue: AppUser(
          uid: '',
          email: '',
          username: '',
          dateJoined: '',
          accessToken: '',
        ),
      )!;
  // static var box = Hive.box('SETTINGS');
  // static int getFontSize() => box.get('fontSize');

  // static setFSize(int size) => box.put('fontSize', size);
}
