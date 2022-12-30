import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/utils/colors.dart';
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
      home: ChatScreen(),
    );
  }
}
