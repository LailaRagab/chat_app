import 'package:chat_app/models/read_message_model.dart';
import 'package:flutter/material.dart';

import '../../style/app_colors/app_colors.dart';

class CustomChatBubbleUser extends StatelessWidget {
  const CustomChatBubbleUser({
    super.key,
    required this.displayReadMessage,
  });

  final ReadMessageModel displayReadMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.kPrimary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 15,
              bottom: 15,
              right: 15,
            ),
            child: Text(
              displayReadMessage.messageContent,
              style: TextStyle(color: AppColors.kWhite),
            ),
          ),
        ),
      ),
    );
  }
}
