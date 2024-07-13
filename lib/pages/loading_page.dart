import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';

class LoadWeather extends StatelessWidget {
  const LoadWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        title: Text(
          'WeatherApp',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppColor.textColor),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.textColor,
          backgroundColor: AppColor.textColor.withOpacity(0.1),
          strokeWidth: 7,
        ),
      ),
    );
  }
}
