import 'package:fights/blocs/fight/fight_bloc.dart';
import 'package:fights/blocs/internal/history/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      cubit: context.bloc<FightBloc>().historyBloc,
      builder: (context, state) {
        return Container();
      },
    );
  }
}
