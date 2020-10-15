part of 'chat_bloc.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatInitializedState extends ChatState {
  List<MessageModel> messages;

  ChatInitializedState({this.messages});
}
