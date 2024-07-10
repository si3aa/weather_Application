import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          Text(
            'Today',
            style: TextStyle(color: AppColor.textColor),
          ),
          Text(
            '30°',
            style: TextStyle(color: AppColor.textColor),
          ),
          Icon(
            Icons.sunny,
            color: AppColor.textColor,
          ),
          Text(
            'Sunny',
            style: TextStyle(color: AppColor.textColor),
          ),
        ],
      ),
    );
  }
}
