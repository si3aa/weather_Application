import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/cubit/get_weather/get_cubit.dart';
import 'package:weather/cubit/get_weather/get_state.dart';
import 'package:weather/pages/custom_search_text_filed.dart';
import 'package:weather/pages/error_page.dart';
import 'package:weather/pages/loading_page.dart';
import 'package:weather/pages/weather_body.dart';

class HomePage extends StatefulWidget {
  static String routeName = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWeather();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SearchTextFiled(),
            const Spacer(),
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
              if (state is LoadingWeather) {
                return const LoadWeather();
              } else if (state is SuccessWeather) {
                return const WeatherBody();
              } else {
                return const ErrorPage();
              }
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
