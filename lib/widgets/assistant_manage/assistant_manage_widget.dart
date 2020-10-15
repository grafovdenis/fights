import 'package:fights/blocs/fight/fight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/internal/bloc/assistant_manage_bloc.dart';

class AssistantManageWidget extends StatelessWidget {
  const AssistantManageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssistantManageBloc, AssistantManageState>(
      cubit: context.bloc<FightBloc>().assistantManageBloc,
      builder: (context, state) {
        return Container();
      },
    );
  }
}
