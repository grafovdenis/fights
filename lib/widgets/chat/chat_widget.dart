import 'package:fights/blocs/internal/chat/chat_bloc.dart';
import 'package:fights/blocs/fight/fight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_widget.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({Key key}) : super(key: key);

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, ChatState>(
            cubit: context.bloc<FightBloc>().chatBloc,
            builder: (context, state) {
              if (state is ChatInitializedState && state.messages != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.jumpTo(controller.position.maxScrollExtent);
                });
                return ListView.builder(
                    controller: controller,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      return MessageWidget(model: state.messages[index]);
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromRGBO(88, 88, 88, 1),
                child: IconButton(
                  icon: Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 8),
              Flexible(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Напишите свое сообщение'),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.emoji_emotions,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
