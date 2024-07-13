import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/cubit/get_weather/get_cubit.dart';

class SearchTextFiled extends StatefulWidget {
  const SearchTextFiled({super.key});

  @override
  State<SearchTextFiled> createState() => _SearchTextFiledState();
}

class _SearchTextFiledState extends State<SearchTextFiled> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search =TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:const EdgeInsets.all(16) ,
            decoration: BoxDecoration(
              color: AppColor.textColor.withOpacity(.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child:  TextField(
              controller: search,
              onSubmitted: (value) {
                BlocProvider.of<WeatherCubit>(context).getWeather(loc: value);
              },
              cursorColor: AppColor.backgroundColor,
              decoration: const InputDecoration(
                hintText: "Search here...",
                suffixIcon:  Icon(Icons.search),
                border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }
}
