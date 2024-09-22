import 'package:dio/dio.dart';

import '../models/product_model.dart';

void main() {
  GetCategoriesProduct().getCategoriesProduct(categoryname: 'jewelery');
}

class GetCategoriesProduct {
  final Dio dio = Dio();

  Future<List<ProductModel>> getCategoriesProduct(
      {required String categoryname}) async {
    try {
      final response = await dio
          .get('https://fakestoreapi.com/products/category/$categoryname');
      List<dynamic> data = response.data;
      List<ProductModel> categories = [];
      for (var i = 0; i < data.length; i++) {
        categories.add(ProductModel.fromJson(data[i]));
      }
      return categories;
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
