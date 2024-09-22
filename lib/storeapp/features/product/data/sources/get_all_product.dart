import 'package:dio/dio.dart';

import '../models/product_model.dart';

class GetAllProduct {
  final Dio dio = Dio();

  Future<List<ProductModel>> getAllProduct() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');

      return (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }
}
