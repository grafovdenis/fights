import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fight/fight_bloc.dart';
import '../../blocs/internal/management/management_bloc.dart';

class ManagementWidget extends StatelessWidget {
  const ManagementWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagementBloc, ManagementState>(
      cubit: context.bloc<FightBloc>().managementBloc,
      builder: (context, state) {
        if (state is ManagementInitial) {
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
