import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/internal/info/info_bloc.dart';
import '../../blocs/fight/fight_bloc.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoBloc, InfoState>(
      cubit: context.bloc<FightBloc>().infoBloc,
      builder: (context, state) {
        return Center(
          child: Text('Информация'),
        );
      },
    );
  }
}
