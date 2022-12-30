import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_gpt/models/message_model.dart';
import 'package:flutter_chat_gpt/repository/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  ChatBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatInitial()) {
    on<SendMessageEvent>(_handleSendMessageEvent);
  }

  Future<void> _handleSendMessageEvent(
      SendMessageEvent event, Emitter emit) async {
    _chatRepository.chats.add(
      MessageModel(message: event.question, isBot: false),
    );
    emit(ChatLoadingState());
    try {
      await _chatRepository.sendMessage(event.question);
      emit(ChatGPTRepliedState());
    } catch (e) {
      log(e.toString());
      emit(ChatErrorState(errorMsg: e.toString()));
    }
  }
}
