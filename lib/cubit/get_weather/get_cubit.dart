import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather/get_state.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/dio.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitWeather());
  WeatherModel2? weather;
  void getWeather() async {
    try {
      weather = await WeatherDio().getHttp();
    } catch (e) {
      print(e);
    }
  }
}
