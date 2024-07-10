import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/custom_search_text_filed.dart';
import 'package:weather/pages/weather_body.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  static String routeName = "home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  void getHttp() async {
    final response = await dio
        .get('https://api.weatherapi.com/v1/forecast.json', queryParameters: {
      'key': "a0f8e52f97f744d5b92141431240102",
      'q': "cairo",
      'aqi': "no"
    });
    WeatherModel model = WeatherModel.fromJson(response.data);

    print(model.cityName);
    print(model.country);
    print(model.tempC);
    print(model.weatherStatus);
    print(model.weatherIcon);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getHttp();
        },
      ),
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        title: const Text(
          'WeatherApp',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppColor.textColor),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [SearchTextFiled(), Spacer(), WeatherBody()],
        ),
      ),
    );
  }
}
