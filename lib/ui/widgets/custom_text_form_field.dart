import 'package:flutter/material.dart';

import '../../style/app_colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, this.onChange, this.forSecurity = false, required this.hintText});

  final String hintText;
  final bool forSecurity;
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: forSecurity,
      validator: (input) {
        if (input!.isEmpty) {
          return "Field is required";
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.kWhite),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kWhite)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kWhite))),
    );
  }
}
