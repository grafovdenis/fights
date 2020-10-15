import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../models/_authors.dart';
import '../../../models/_messages.dart';
import '../../../models/message_model.dart';
import '../../../models/roles.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial());

  List<MessageModel> _messages;

  Stream<MessageModel> messagesStream;

  void _init() async {
    /// MOCK
    _messages = await getChatHistory();
    messagesStream = Stream.periodic(
      const Duration(seconds: 1),
      (index) {
        return MessageModel(
          role: roles[index % roles.length],
          author: authors[index % authors.length],
          message: messages[index % messages.length],
        );
      },
    );

    messagesStream.listen((message) {
      add(AddRemoteMessage(message));
    });
  }

  /// MOCK
  Future<List<MessageModel>> getChatHistory() async {
    return Future.delayed(
        const Duration(seconds: 2),
        () => List.generate(
              10,
              (index) => MessageModel(
                role: roles[index % roles.length],
                author: authors[index % authors.length],
                message: messages[index % messages.length],
              ),
            ));
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is InitChatEvent) {
      _init();
      print('Initialized');
      yield ChatInitializedState(messages: _messages);
    } else if (event is AddRemoteMessage) {
      _messages.add(event.message);
      yield ChatInitializedState(messages: _messages);
    }
  }
}
