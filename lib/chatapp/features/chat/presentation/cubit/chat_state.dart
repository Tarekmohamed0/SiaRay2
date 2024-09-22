part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatSucsess extends ChatState {
  List<Message> messageList = [];
  ChatSucsess({required this.messageList});
}
