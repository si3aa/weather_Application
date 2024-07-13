// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:weather/constant/colors.dart';
import 'package:weather/cubit/get_weather/get_cubit.dart';
import 'package:weather/models/weather.dart';

// ignore: must_be_immutable
class WeatherCard extends StatefulWidget {
  int index = 0;
  WeatherCard({
    super.key,
    required this.index,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    WeatherModel2 weather = BlocProvider.of<WeatherCubit>(context).weather!;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.textColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                DateFormat("E - d").format(
                  DateTime.parse(
                    weather.forecast.forecastday[widget.index].date
                        .toString(),
                  ),
                ),
                style: TextStyle(color: AppColor.textColor, fontSize: 20),
              ),
              const SizedBox(height: 14),
              Text(
                weather.forecast.forecastday[widget.index].day.condition.text,
                style: TextStyle(color: AppColor.textColor, fontSize: 20),
              ),
              const SizedBox(height: 14),

              Image.network(
                    'https:${weather.forecast.forecastday[0].day.condition.icon}')
              
              ,const SizedBox(height: 14),
              Text(
                weather.forecast.forecastday[widget.index].day.avgtempC
                    .toString(),
                style: TextStyle(color: AppColor.textColor, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
