import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fight/fight_bloc.dart';
import '../bloc/fight/fight_state.dart';

class FightPage extends StatelessWidget {
  const FightPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FightBloc, FightState>(
      builder: (context, state) {
        if (state is InitialFightState) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is WaitingTimeState) {
          if (state.role != "arbitrator") {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Игровая комната"),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        child: Text("Чат"),
                      ),
                      Tab(
                        child: Text("Информация"),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Text("Чат"),
                    Text("Информация"),
                  ],
                ),
              ),
            );
          } else {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Игровая комната"),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        child: Text("Управление"),
                      ),
                      Tab(
                        child: Text("Чат"),
                      ),
                      Tab(
                        child: Text("Информация"),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Text(
                      "Управление",
                    ),
                    Text("Чат"),
                    Text("Информация"),
                  ],
                ),
              ),
            );
          }
        } else if (state is BriefingState) {
          return Scaffold(
            body: Center(
              child: Text("Брифинг"),
            ),
          );
        } else if (state is RoundState) {
          return Scaffold(
            body: Center(
              child: Text("Раунд"),
            ),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
