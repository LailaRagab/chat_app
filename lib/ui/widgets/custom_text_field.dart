import 'package:flutter/material.dart';

import '../../style/app_colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText});
final String hintText;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.kWhite),
          enabledBorder:
          OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kWhite)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kWhite)
          )
      ),
    );
  }
}
