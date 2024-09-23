import 'package:first_project/weatherApp/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:first_project/weatherApp/data/models/weatherModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/weatherServices.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  late Weathermodel weatherModel;
  void getWeather(String cityName) async {
    // emit(LoadedWeatherState());
    try {
      weatherModel = await WeatherServices().getCurrentWeather(cityName);
      emit(LoadedWeatherState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
