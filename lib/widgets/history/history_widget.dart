import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fight/fight_bloc.dart';
import '../../blocs/internal/history/history_bloc.dart';

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
