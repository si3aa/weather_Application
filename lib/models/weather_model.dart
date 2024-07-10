// mvc => model view controller

class WeatherModel {
  String cityName;
  String country;
  double tempC;
  String weatherStatus;
  String weatherIcon;
  WeatherModel({
    required this.cityName,
    required this.country,
    required this.tempC,
    required this.weatherStatus,
    required this.weatherIcon,
  });
  factory WeatherModel.fromJson(dynamic json) => WeatherModel(
        cityName: json['location']['name'],
        country: json['location']['country'],
        tempC: json['current']['temp_c'],
        weatherStatus: json['current']['condition']['text'],
        weatherIcon: json['current']['condition']['icon'],
      );
}


// {
//     cityName = json['location']['name'];
//     country = json['location']['country'];
//     tempC = json['current']['temp_c'];
//     weatherStatus = json['current']['condition']['text'];
//     weatherIcon = json['current']['condition']['icon'];
//   }