import 'package:dio/dio.dart';

class BlogsApi {
  String blogsUrl = 'https://everyday-api.vercel.app/api/v1/blogs/';
  // String genericUrl = 'https://everyday-api.vercel.app/api/v1/generic_drugs/';

  Future<List<Map<String, dynamic>>> getAllBlogs() async {
    Response<dynamic> response = await Dio().get(blogsUrl);
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      return [];
    }
  }
  // Future<List<Map<String, dynamic>>> getAllCategory() async {
  //   Response<dynamic> response = await Dio().get(brandUrl);
  //   if (response.statusCode == 201) {
  //     Map responseData = response.data as Map;
  //     return List<Map<String, dynamic>>.from(responseData['data']);
  //   } else {
  //     return [];
  //   }
  // }
}
