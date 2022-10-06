import 'package:dio/dio.dart';

class UserApi {
  String url = 'https://everyday-api.vercel.app/api/v1/user/';

  Future<bool> postNewUser(Map<String, dynamic> data) async {
    bool isSuccessful = false;
    Response<dynamic> response = await Dio().post(url, data: data);
    if (response.statusCode == 201) {
      // Map responseData = response.data as Map;
      isSuccessful = true;
      return isSuccessful;
    } else {
      return isSuccessful;
    }
  }

  Future<Map<String, dynamic>> getUser(String uid) async {
    Response<dynamic> response = await Dio().get("$url$uid");
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return responseData['data'];
    } else {
      return {};
    }
  }
}
