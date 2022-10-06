import 'package:everyday/api/blogs.dart';
import 'package:everyday/models/blogs.dart';

class BlogsDb {
  static BlogsApi bogsApi = BlogsApi();

  static Future<List<Blog>> getAllBrands() async {
    List<Blog> _notes = [];
    try {
      var listOfMaps = await bogsApi.getAllBlogs();
      for (var i in listOfMaps) {
        _notes.add(Blog.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _notes;
  }
}
