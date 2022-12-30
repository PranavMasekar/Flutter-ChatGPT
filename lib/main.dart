import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_gpt/bloc/chat%20bloc/chat_bloc.dart';
import 'package:flutter_chat_gpt/repository/chat_repository.dart';
import 'package:flutter_chat_gpt/services/chat_service.dart';
import 'package:flutter_chat_gpt/utils/colors.dart';
import 'package:flutter_chat_gpt/utils/constants.dart';
import 'package:flutter_chat_gpt/views/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ChatGPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.backgroundColor,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColors.backgroundColor,
        ),
      ),
      home: RepositoryProvider(
        create: (context) => ChatRepository(chatService: ChatService()),
        child: BlocProvider(
          create: (context) => ChatBloc(
            chatRepository: context.read<ChatRepository>(),
          ),
          child: ChatScreen(),
        ),
      ),
    );
  }
}
