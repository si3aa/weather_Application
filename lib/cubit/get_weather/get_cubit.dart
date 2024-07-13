import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/cubit/get_weather/get_state.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/dio.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitWeather());
  WeatherModel2? weather;
  void getWeather({String loc = 'Cairo'}) async {
    emit(LoadingWeather());
    try {
      weather = await WeatherDio().getHttp(loc: loc);
      switch (weather!.current.condition.text) {
        case 'Mist':
          {
            AppColor.textColor = AppColor.white;
            AppColor.backgroundColor = AppColor.orange;
          }
        case 'Clear':
          {
            AppColor.textColor = AppColor.backgroundColor;
            AppColor.backgroundColor = AppColor.textColor;
          }
        case 'Clouds':
          {
            AppColor.textColor = AppColor.white;
            AppColor.backgroundColor = AppColor.backgroundColor;
          }
        case 'Sunny':
          {
            AppColor.textColor = AppColor.white;
            AppColor.backgroundColor = AppColor.orange;
          }
      }
      emit(SuccessWeather());
    } catch (e) {
      emit(FailureWeather(message: e.toString()));
    }
  }
}
