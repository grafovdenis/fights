import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fight/fight_bloc.dart';
import '../../blocs/internal/situation/situation_bloc.dart';

class SituationWidget extends StatelessWidget {
  const SituationWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SituationBloc, SituationState>(
      cubit: context.bloc<FightBloc>().situationBloc,
      builder: (context, state) {
        return Center(child: Text('Ситуация'));
      },
    );
  }
}
