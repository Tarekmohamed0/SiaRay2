import 'package:dio/dio.dart';

class UpdateProductt {
  final Dio dio = Dio();

  Future<void> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String category,
      required String image}) async {
    try {
      await dio.put('https://fakestoreapi.com/products/$id', data: {
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
