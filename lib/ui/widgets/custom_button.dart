import 'package:flutter/material.dart';

import '../../style/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.title});

  String title;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        color: AppColors.kWhite,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: AppColors.kPrimary),
          ),
        ),
      ),
    );
  }
}
