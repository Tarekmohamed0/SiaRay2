class WeatherState {}

class NoWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  // final Weathermodel weatherModel;

  // LoadedWeatherState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {}
