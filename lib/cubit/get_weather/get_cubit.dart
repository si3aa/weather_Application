import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/colors.dart';
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
      getThemeColor('');
      emit(SuccessWeather());
    } catch (e) {
      emit(FailureWeather(message: e.toString()));
    }
  }

  getThemeColor(String? condition) {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return AppColor.backgroundColor = AppColor.orange;
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return AppColor.backgroundColor = AppColor.backgroundColor;
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist' ||
        condition == 'Fog') {
      return AppColor.backgroundColor = Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return AppColor.backgroundColor = Colors.blue;
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return AppColor.backgroundColor = Colors.deepPurple;
    } else {
      return AppColor.backgroundColor= AppColor.backgroundColor;
    }
  }
}
