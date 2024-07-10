import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Something Error",
              style: TextStyle(color: AppColor.textColor, fontSize: 30),
            ),
            Text(
              "Please try again",
              style: TextStyle(color: AppColor.textColor, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
