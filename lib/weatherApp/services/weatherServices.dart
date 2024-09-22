import 'dart:developer';

import 'package:first_project/weatherApp/data/models/weatherModel.dart';
import 'package:dio/dio.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String apiKey =
      '00d8cc2558744fb98c4194119240509'; // i must to secure this api key by using flutter secure storage
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String endpoint = 'forecast.json';

  Future<Weathermodel> getCurrentWeather(String city) async {
    try {
      // API call to get current weather
      final response =
          await dio.get('$baseUrl/$endpoint?key=$apiKey&q=$city&aqi=no&days=1');

      Weathermodel weatherModel = Weathermodel.fromJson(response.data);
      return weatherModel;
      // API response
      // i need to check the response and see if it is a success or not by modifying the baseurl
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'there was an error';
      log(errorMessage);
      throw Exception(
          'Failed to load weather data and this is the error: $errorMessage');
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load weather data');
    }
  }
}
