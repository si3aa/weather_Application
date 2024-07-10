import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/pages/custom_search_text_filed.dart';
import 'package:weather/pages/weather_body.dart';

class HomePage extends StatefulWidget {
  static String routeName = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            SearchTextFiled(),
            Spacer(),
            WeatherBody()
          ],
        ),
      ),
    );
  }
}
