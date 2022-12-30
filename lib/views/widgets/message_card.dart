import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/models/message_model.dart';
import 'package:flutter_chat_gpt/utils/colors.dart';
import 'package:flutter_chat_gpt/utils/text_styles.dart';

class MessageCard extends StatelessWidget {
  final MessageModel model;
  const MessageCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: model.isBot
          ? AppColors.botBackgroundColor
          : AppColors.backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: model.isBot ? AppColors.green : Colors.cyan,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: model.isBot
                  ? Image.asset(
                      "assets/bot.png",
                      color: AppColors.textColor,
                    )
                  : Center(
                      child: Text(
                        "P",
                        style: MyTextStyles.headerTextStyle,
                      ),
                    ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 280,
            child: Text(
              model.message,
              style: MyTextStyles.normalTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
