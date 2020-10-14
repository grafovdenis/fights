import 'package:fights/bloc/fight/fight_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fights/bloc/fight/fight_bloc.dart';
import 'package:fights/bloc/fight/fight_state.dart';

import 'fight_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Go to fightPage"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    lazy: true,
                    create: (_) =>
                        FightBloc(InitialFightState())..add(InitEvent()),
                    child: FightPage(),
                  ),
                ));
              },
            ),
            RaisedButton(
              child: Text("Enter as a player"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    lazy: true,
                    create: (_) => FightBloc(InitialFightState())
                      ..add(InitEvent(role: "player")),
                    child: FightPage(),
                  ),
                ));
              },
            ),
            RaisedButton(
              child: Text("Enter as an arbitrator"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    lazy: true,
                    create: (_) => FightBloc(InitialFightState())
                      ..add(InitEvent(role: "arbitrator")),
                    child: FightPage(),
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
