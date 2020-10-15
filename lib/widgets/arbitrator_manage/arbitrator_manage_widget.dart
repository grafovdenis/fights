import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fight/fight_bloc.dart';
import '../../blocs/internal/arbitrator_manage/arbitrator_manage_bloc.dart';

class ArbitratorManageWidget extends StatelessWidget {
  const ArbitratorManageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArbitratorManageBloc, ArbitratorManageState>(
      cubit: context.bloc<FightBloc>().arbitratorManageBloc,
      builder: (context, state) {
        if (state is ArbitratorManageInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(child: Text('Management'));
        }
      },
    );
  }
}
