import 'package:dio/dio.dart';

class DrugsApi {
  String productsUrl = 'https://smattlife-api.vercel.app/api/v1/products';
  String genericUrl = 'https://everyday-api.vercel.app/api/v1/generic_drugs/';

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    Response<dynamic> response = await Dio().get(productsUrl);
    if (response.statusCode == 201) {
      Map responseData = response.data as Map;
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      return [];
    }
  }
}
