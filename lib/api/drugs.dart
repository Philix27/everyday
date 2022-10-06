import 'package:dio/dio.dart';

class DrugsApi {
  String brandUrl = 'https://everyday-api.vercel.app/api/v1/brand_drugs/';
  String genericUrl = 'https://everyday-api.vercel.app/api/v1/generic_drugs/';

  Future<List<Map<String, dynamic>>> getAllBrands() async {
    Response<dynamic> response = await Dio().get(brandUrl);
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
