import 'package:dio/dio.dart';

class NotesApi {
  String url = 'https://everyday-api.vercel.app/api/v1/articles/';
  String mcqCategoryUrl =
      'https://everyday-api.vercel.app/api/v1/articles_category/';

  Future<List<Map<String, dynamic>>> getAll() async {
    Response<dynamic> response = await Dio().get(url);
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getAllCategory() async {
    Response<dynamic> response = await Dio().get(mcqCategoryUrl);
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      return [];
    }
  }
}
