import 'package:dio/dio.dart';

import '../data/models/prudectmodeltest.dart';

class productServcies {
  final Dio dio = Dio();

  final String baseUrl = 'https://fakestoreapi.com/products';
  final String endpoint = 'products';
  final String apiKey = '00d8cc2558744fb98c4194119240509';

  Future<ProductModel> getProducts() async {
    try {
      final response = await dio.get('$baseUrl/$endpoint');
      final ProductModel products = ProductModel.fromjson(response.data);

      return products;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'there was an error';
      throw Exception(
          'Failed to load products and this is the error: $errorMessage');
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
