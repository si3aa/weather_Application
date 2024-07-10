// mvc => model view controller

class WeatherModel {
  String? cityName;
  String? country;
  double? tempC;
  String? weatherStatus;
  String? weatherIcon;
  WeatherModel({
    required this.cityName,
    required this.country,
    required this.tempC,
    required this.weatherStatus,
    required this.weatherIcon,
  });
}
