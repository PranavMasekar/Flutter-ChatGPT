part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatErrorState extends ChatState {
  final String errorMsg;

  ChatErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

class ChatGPTRepliedState extends ChatState {}
