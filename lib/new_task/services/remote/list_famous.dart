import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_project/new_task/models/famous_model.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<List<FamousModel>> GetAllFamous() async {
    const baseurl = 'https://gellallfaous.com';

    try {
      final response = await dio.get(baseurl);
      if (response.data != null) {
        log('your data is :${response.data}');
      }
      return (response.data as List)
          .map((famous) => FamousModel.fromjson(famous))
          .toList();
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      log('there is an error $e');
      throw Exception(e);
    }
  }
}
