import 'package:fights/widgets/chat/chat_widget.dart';
import 'package:fights/widgets/game_video_header.dart';
import 'package:fights/widgets/management/management_widget.dart';
import 'package:fights/widgets/player/player_widget.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String role;
  const GamePage({Key key, this.role}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Tab buildTab() {
      switch (widget.role) {
        case "arbitrator":
        case "second":
          return Tab(child: Text("Управление"));
        case "player":
          return Tab(child: Text("Игра"));
        default:
          return Tab(child: Text("События"));
      }
    }

    Widget buildWidget() {
      switch (widget.role) {
        case "arbitrator":
          return ManagementWidget();
        case "second":
          return ManagementWidget();
        case "player":
          return PlayerWidget();
        default:
          return Tab(child: Text("События"));
      }
    }

    final TabController tabController = TabController(
      length: 3,
      vsync: this,
    );

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: GameVideoHeader(
        height: 281,
        tabs: [
          buildTab(),
          Tab(child: Text("Ситуация")),
          Tab(child: Text("Чат")),
        ],
        view: Container(
          color: Colors.yellow,
          height: 281 - 48.0,
        ),
        tabController: tabController,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildWidget(),
          Text("Ситуация"),
          ChatWidget(),
        ],
      ),
    );
  }
}
