import 'package:flutter/material.dart';

import '../../style/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: AppColors.kWhite,
      child: Center(
        child: Text(title,
          style: TextStyle(
              color: AppColors.kPrimary
          ),),
      ),

    );
  }
}
