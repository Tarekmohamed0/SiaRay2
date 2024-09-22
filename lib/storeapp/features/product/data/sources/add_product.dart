import 'package:dio/dio.dart';

class AddProduct {
  final Dio dio = Dio();

  Future<void> addProduct(
      {required String title,
      required String price,
      required String description,
      required String category,
      required String image}) async {
    try {
      await dio.post('https://fakestoreapi.com/products', data: {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image
      });
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
