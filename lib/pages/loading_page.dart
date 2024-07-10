import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';

class LoadingWeather extends StatelessWidget {
  const LoadingWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: AppColor.textColor,
          backgroundColor: AppColor.textColor.withOpacity(0.1),
          strokeWidth: 7,
        ),
      ),
    );
  }
}
