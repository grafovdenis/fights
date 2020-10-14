import 'package:fights/bloc/fight/fight_event.dart';
import 'package:fights/pages/internal/waiting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fight/fight_bloc.dart';
import '../bloc/fight/fight_state.dart';
import 'internal/round_page.dart';

class FightPage extends StatelessWidget {
  const FightPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FightBloc, FightState>(
        builder: (context, state) {
          print(state);
          if (state is InitialFightState) {
            return Scaffold(
              appBar: AppBar(title: Text("Подключение...")),
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is WaitingTimeState) {
            return WaitingPage(role: state.role);
          } else if (state is RoundState) {
            return RoundPage(role: state.role);
          } else {
            return Scaffold(
              body: Center(
                child: Text(state.toString()),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_rounded),
        onPressed: () {
          context.bloc<FightBloc>().add(NextPhaseEvent());
        },
      ),
    );
  }
}
