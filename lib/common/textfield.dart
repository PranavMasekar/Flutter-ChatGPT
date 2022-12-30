import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/utils/colors.dart';
import 'package:flutter_chat_gpt/utils/text_styles.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  const MyTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      style: MyTextStyles.normalTextStyle,
      controller: controller,
      decoration: InputDecoration(
        fillColor: AppColors.botBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.backgroundColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.botBackgroundColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.botBackgroundColor, width: 2),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
    );
  }
}
