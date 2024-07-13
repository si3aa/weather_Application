import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/pages/custom_search_text_filed.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SearchTextFiled(),
              const Spacer(),
              Text(
                "Something Error",
                style: TextStyle(color: AppColor.textColor, fontSize: 30),
              ),
              Text(
                "Please try again",
                style: TextStyle(color: AppColor.textColor, fontSize: 30),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
