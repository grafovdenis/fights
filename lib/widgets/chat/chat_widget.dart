import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("bla bla bla"),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
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
                                hintText: "Напишите свое сообщение"),
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
          ),
        )
      ],
    );
  }
}
