import 'package:fights/models/message_model.dart';
import 'package:fights/models/roles.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel model;
  const MessageWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buildColor() {
      switch (model.role) {
        case arbitrator:
          return Color.fromRGBO(0, 206, 206, 1);
        case player:
          return Colors.red;
        case second:
          return Colors.orange;
        default:
          return Colors.blue;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
      child: RichText(
        text: TextSpan(
          text: '${model.author}: ',
          style: TextStyle(color: buildColor(), fontWeight: FontWeight.w500),
          children: <TextSpan>[
            TextSpan(
                text: '${model.message}',
                style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
