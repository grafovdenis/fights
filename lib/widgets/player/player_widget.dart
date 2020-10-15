import 'package:fights/blocs/fight/fight_bloc.dart';
import 'package:fights/blocs/internal/player/player_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      cubit: context.bloc<FightBloc>().playerBloc,
      builder: (context, state) {
        return Center(
          child: Text("Игра"),
        );
      },
    );
  }
}
