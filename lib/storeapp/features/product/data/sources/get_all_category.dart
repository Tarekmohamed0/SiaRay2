import 'package:dio/dio.dart';

void main() {
  GetAllCategory().getAllCategory();
}

class GetAllCategory {
  final Dio dio = Dio();

  Future<List<dynamic>> getAllCategory() async {
    try {
      final response =
          await dio.get('https://fakestoreapi.com/products/categories');
      List<dynamic> data = response.data;
      List<String> categories = [];
      for (var i = 0; i < data.length; i++) {
        categories.add(data[i]);
      }

      return categories;
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
