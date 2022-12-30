part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final String question;

  SendMessageEvent({required this.question});
  @override
  List<Object> get props => [question];
}
