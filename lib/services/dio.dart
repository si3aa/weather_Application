import 'package:dio/dio.dart';
import 'package:weather/models/weather.dart';

class WeatherDio {
  final dio = Dio();
  Future<WeatherModel2> getHttp({required String loc}) async {
    final response = await dio
        .get('https://api.weatherapi.com/v1/forecast.json', queryParameters: {
      'key': "a0f8e52f97f744d5b92141431240102",
      'q': loc,
      'aqi': "no",
      'days': 3
    });

    WeatherModel2 weather = WeatherModel2.fromJson(response.data);
    return weather;
  }
}
