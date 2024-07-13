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
  List<IconData> iconList = [Icons.cloud, Icons.cloud, Icons.cloud];
  void getWeather({String loc = 'Cairo'}) async {
    emit(LoadingWeather());
    try {
      weather = await WeatherDio().getHttp(loc: loc);
      getColor();
      getListIcons(index: 0);
      getListIcons(index: 1);
      getListIcons(index: 2);

      emit(SuccessWeather());
    } catch (e) {
      emit(FailureWeather(message: e.toString()));
    }
  }

  getListIcons({required int index}) {
    switch (weather!.forecast.forecastday[index].day.condition.text) {
      case 'Sunny':
        iconList[index] = Icons.sunny;
        icon =Icons.sunny;
         case 'Partly Cloudy':
          iconList[index] = Icons.cloud;
          icon =Icons.cloud;
    }
  }

  getColor() {
    switch (weather!.current.condition.text) {
      case 'Mist':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor =Colors.indigo;
        }
      case 'Clear':
        {
          AppColor.textColor = AppColor.backgroundColor;
          AppColor.backgroundColor = AppColor.textColor;
        }
      case 'Partly Cloudy':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = AppColor.backgroundColor;
        }
      case 'Sunny':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = AppColor.orange;
        }
      case ' Cloudy':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = AppColor.backgroundColor;
        }
      case 'Overcast':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = Colors.grey;
        }
        case 'Patchy rain possible':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = Colors.grey;
        }
         case 'Patchy sleet possible':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = Colors.grey;
        }
         case 'Patchy freezing drizzle possible':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = Colors.grey;
        }
        case 'Thundery outbreaks possible':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = Colors.grey;
        }
         case 'Blowing snow':
        {
          AppColor.textColor = AppColor.white;
          AppColor.backgroundColor = Colors.grey;
        }
    }
  }
}
