import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather/get_cubit.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/pages/splash_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          HomePage.routeName: (_) => const HomePage(),
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
