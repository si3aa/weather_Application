import 'package:flutter/material.dart';
import 'package:weather/components/custom_card.dart';
import 'package:weather/constant/colors.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.location_pin,
              color: AppColor.textColor,
              size: 50,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Egypt",
                  style: TextStyle(fontSize: 22, color: AppColor.textColor),
                ),
                Text(
                  "Cairo",
                  style: TextStyle(color: AppColor.textColor),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Sunny",
                  style: TextStyle(fontSize: 22, color: AppColor.textColor),
                ),
                Text(
                  "30°",
                  style: TextStyle(color: AppColor.textColor),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.sunny,
              color: AppColor.textColor,
              size: 60,
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            WeatherCard(),
            WeatherCard(),
            WeatherCard(),

          ],
        )
      ],
    );
  }
}
