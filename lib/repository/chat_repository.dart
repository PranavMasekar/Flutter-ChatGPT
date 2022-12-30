import 'dart:developer';

import 'package:flutter_chat_gpt/models/message_model.dart';
import 'package:flutter_chat_gpt/services/chat_service.dart';

class ChatRepository {
  ChatRepository({required ChatService chatService}) : _service = chatService;

  final ChatService _service;
  List<MessageModel> chats = [];
  String? parentMessageID;
  String? conversationID;

  Future sendMessage(String message) async {
    try {
      Map<String, dynamic>? res = await _service.sendMessaage(message);
      log(res.toString());
      if (res != null) {
        chats.add(MessageModel(
            message: res["choices"][0]["text"].trim(), isBot: true));
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
