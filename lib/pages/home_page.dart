import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/fight/fight_event.dart';
import '../blocs/fight/fight_bloc.dart';
import '../models/roles.dart';

import 'fight_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: roles.length,
          itemBuilder: (context, index) => RaisedButton(
                child: Text("Enter as a ${roles[index]}"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      lazy: true,
                      create: (_) =>
                          FightBloc()..add(InitEvent(role: roles[index])),
                      child: FightPage(),
                    ),
                  ));
                },
              )),
    );
  }
}
