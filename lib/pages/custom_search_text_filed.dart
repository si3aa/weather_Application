import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';

class SearchTextFiled extends StatefulWidget {
  const SearchTextFiled({super.key});

  @override
  State<SearchTextFiled> createState() => _SearchTextFiledState();
}

class _SearchTextFiledState extends State<SearchTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:const EdgeInsets.all(16) ,
            decoration: BoxDecoration(
              color: AppColor.textColor.withOpacity(.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              cursorColor: AppColor.backgroundColor,
              decoration: InputDecoration(
                hintText: "Search here...",
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }
}
