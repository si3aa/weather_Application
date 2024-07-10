import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherDio{
   final dio = Dio();
  Future<WeatherModel> getHttp() async {
    final response = await dio
        .get('https://api.weatherapi.com/v1/forecast.json', queryParameters: {
      'key': "a0f8e52f97f744d5b92141431240102",
      'q': "cairo",
      'aqi': "no",
       'day':"3"
    });
    WeatherModel model = WeatherModel.fromJson(response.data);
    return model;

    

  }

}