import 'package:fights/widgets/chat/chat_widget.dart';
import 'package:fights/widgets/info/info_widget.dart';
import 'package:fights/widgets/management/management_widget.dart';
import 'package:flutter/material.dart';

class WaitingPage extends StatelessWidget {
  final String role;
  const WaitingPage({Key key, this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(role);
    return DefaultTabController(
      length: (role == "arbitrator") ? 3 : 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Игровая комната"),
          bottom: TabBar(
            tabs: [
              if (role == "arbitrator") Tab(child: Text("Управление")),
              Tab(child: Text("Чат")),
              Tab(child: Text("Информация")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            if (role == "arbitrator") ManagementWidget(),
            ChatWidget(),
            InfoWidget(),
          ],
        ),
      ),
    );
  }
}
