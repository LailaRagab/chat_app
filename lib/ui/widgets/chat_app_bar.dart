import 'package:flutter/material.dart';

import '../../style/app_colors/app_colors.dart';
import '../../style/images/images.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(Images.scholar)),
          Text(
            "Chat",
            style: TextStyle(color: AppColors.kWhite),
          )
        ],
      ),
    );
  }
}
