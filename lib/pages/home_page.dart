import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/models/weather.dart';

import 'package:weather/pages/custom_search_text_filed.dart';
import 'package:weather/pages/weather_body.dart';
import 'package:weather/services/dio.dart';

class HomePage extends StatefulWidget {
  static String routeName = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel2? w;
  bool isLoading =true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try{
    w = await WeatherDio().getHttp();
    isLoading = false;
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getHttp();
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
