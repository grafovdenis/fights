part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class InitChatEvent extends ChatEvent {}

class AddRemoteMessage extends ChatEvent {
  final MessageModel message;
  AddRemoteMessage(this.message);
}
