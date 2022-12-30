import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_gpt/bloc/chat%20bloc/chat_bloc.dart';
import 'package:flutter_chat_gpt/common/snackbar.dart';
import 'package:flutter_chat_gpt/common/textfield.dart';
import 'package:flutter_chat_gpt/models/message_model.dart';
import 'package:flutter_chat_gpt/repository/chat_repository.dart';
import 'package:flutter_chat_gpt/utils/colors.dart';
import 'package:flutter_chat_gpt/utils/text_styles.dart';
import 'package:flutter_chat_gpt/views/widgets/message_card.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  ChatScreen({super.key});
  final _scrollController = ScrollController();

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.positions.last.maxScrollExtent + 500,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }

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
        body: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is ChatGPTRepliedState) {
              _scrollDown();
            }
            if (state is ChatErrorState) {
              showSnackBar(context, state.errorMsg);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: context.read<ChatRepository>().chats.length,
                      itemBuilder: (context, index) {
                        final MessageModel model =
                            context.read<ChatRepository>().chats[index];
                        return MessageCard(model: model);
                      },
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.all(15),
          child: MyTextField(controller: controller),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
