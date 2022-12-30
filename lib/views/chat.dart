import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/common/textfield.dart';
import 'package:flutter_chat_gpt/models/message_model.dart';
import 'package:flutter_chat_gpt/utils/colors.dart';
import 'package:flutter_chat_gpt/utils/text_styles.dart';
import 'package:flutter_chat_gpt/views/widgets/message_card.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            "Flutter ChatGPT",
            style: MyTextStyles.headerTextStyle,
          ),
          backgroundColor: AppColors.botBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessageCard(
                  model:
                      MessageModel(isBot: false, message: "My name is Pranav"),
                ),
                MessageCard(
                  model: MessageModel(
                    isBot: true,
                    message:
                        "I'm sorry, but it seems like you have entered a short",
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.only(bottom: 15, right: 15, left: 15),
          child: MyTextField(controller: controller),
        ),
      ),
    );
  }
}
