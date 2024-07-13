import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/custom_card.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/cubit/get_weather/get_cubit.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/pages/custom_search_text_filed.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel2 weather = BlocProvider.of<WeatherCubit>(context).weather!;
    IconData iconWeather = BlocProvider.of<WeatherCubit>(context).icon;
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
        child: Column(
          children: [
            const SearchTextFiled(),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.location_pin,
                  color: AppColor.textColor,
                  size: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.location.name,
                      style: TextStyle(fontSize: 28, color: AppColor.textColor),
                    ),
                    Text(
                      weather.location.country,
                      style: TextStyle(color: AppColor.textColor, fontSize: 24),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      weather.current.condition.text,
                      style: TextStyle(fontSize: 24, color: AppColor.textColor),
                    ),
                    Text(
                      weather.current.tempC.toString(),
                      style: TextStyle(color: AppColor.textColor, fontSize: 24),
                    )
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
                Icon(
                  iconWeather,
                  color: AppColor.textColor,
                  size: 70,
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                WeatherCard(index: 0),
                WeatherCard(index: 1),
                WeatherCard(index: 2),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
