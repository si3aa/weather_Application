import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/custom_card.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/cubit/get_weather/get_cubit.dart';
import 'package:weather/models/weather.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel2 weather = BlocProvider.of<WeatherCubit>(context).weather!;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
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
                  style:
                      const TextStyle(fontSize: 28, color: AppColor.textColor),
                ),
                 Text(
                   weather.location.country,
                  style: const TextStyle(color: AppColor.textColor, fontSize: 24),
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
                  style: const TextStyle(fontSize: 24, color: AppColor.textColor),
                ),
                Text(
                  weather.current.tempC.toString(),
                  style: const TextStyle(color: AppColor.textColor, fontSize: 24),
                )
              ],
            ),
            const SizedBox(
              width: 24,
            ),
            const Icon(
              Icons.sunny,
              color: AppColor.textColor,
              size: 70,
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
         Row(
          children: [
            WeatherCard(index: 0),
            WeatherCard(index: 1),
            WeatherCard(index: 2),
          ],
        )
      ],
    );
  }
}
