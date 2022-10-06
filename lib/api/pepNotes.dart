import 'package:dio/dio.dart';

class PepNotesApi {
  String url = 'https://everyday-api.vercel.app/api/v1/pep_note/';
  String pepMcqUrl = 'https://everyday-api.vercel.app/api/v1/pep_mcq/';
  String pepMcqDemoUrl = 'https://everyday-api.vercel.app/api/v1/pep_mcq_demo/';

  Future<List<Map<String, dynamic>>> getAll() async {
    Response<dynamic> response = await Dio().get(url);
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getPepMcqAll() async {
    Response<dynamic> response = await Dio().get(pepMcqUrl);
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getPepMcqDemoAll() async {
    Response<dynamic> response = await Dio().get(pepMcqDemoUrl);
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      return [];
    }
  }
}
