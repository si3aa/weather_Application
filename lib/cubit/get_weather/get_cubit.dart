import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather/get_state.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/dio.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitWeather());
  WeatherModel2? weather;
  IconData icon = Icons.sunny;
  void getWeather({String loc = 'Cairo'}) async {
    emit(LoadingWeather());
    try {
      weather = await WeatherDio().getHttp(loc: loc);
      emit(SuccessWeather());
    } catch (e) {
      emit(FailureWeather(message: e.toString()));
    }
  }
}
