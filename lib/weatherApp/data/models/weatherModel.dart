class Weathermodel {
  final String cityName;
  final double temperature;
  final String date;
  final String? iconUrl;
  final double maxtemp;
  final double mintemp;
  final String wheatherCondition;

  Weathermodel(
    this.iconUrl, {
    required this.date,
    required this.maxtemp,
    required this.mintemp,
    required this.wheatherCondition,
    required this.cityName,
    required this.temperature,
  });

  factory Weathermodel.fromJson(Map<String, dynamic> json) {
    final cityName = json['location']['name'];
    final temperature = json['forecast']['forecastday'][0]['day']['avgtemp_c'];
    final date = json['current']['last_updated'];
    final iconUrl =
        json['forecast']['forecastday'][0]['day']['condition']['icon'];
    final maxtemp = json['forecast']['forecastday'][0]['day']['maxtemp_c'];
    final mintemp = json['forecast']['forecastday'][0]['day']['mintemp_c'];
    final wheatherCondition =
        json['forecast']['forecastday'][0]['day']['condition']['text'];

    return Weathermodel(
      iconUrl,
      cityName: cityName,
      temperature: temperature,
      date: date,
      maxtemp: maxtemp,
      mintemp: mintemp,
      wheatherCondition: wheatherCondition,
    );
  }
}
