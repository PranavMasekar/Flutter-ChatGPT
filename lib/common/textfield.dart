import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_gpt/bloc/chat%20bloc/chat_bloc.dart';
import 'package:flutter_chat_gpt/utils/colors.dart';
import 'package:flutter_chat_gpt/utils/text_styles.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  const MyTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return TextField(
          textCapitalization: TextCapitalization.sentences,
          style: MyTextStyles.normalTextStyle,
          controller: controller,
          decoration: InputDecoration(
            fillColor: AppColors.botBackgroundColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.backgroundColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.botBackgroundColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppColors.botBackgroundColor, width: 2),
            ),
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            suffixIcon: (state is ChatLoadingState)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      color: AppColors.textColor,
                      strokeWidth: 2,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      if (!(state is ChatLoadingState) &&
                          controller.text != "") {
                        context.read<ChatBloc>().add(
                              SendMessageEvent(question: controller.text),
                            );
                        controller.clear();
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppColors.backgroundColor,
                    ),
                  ),
          ),
          onSubmitted: (value) {
            if (value != "") {
              context.read<ChatBloc>().add(SendMessageEvent(question: value));
              controller.clear();
            }
          },
        );
      },
    );
  }
}
