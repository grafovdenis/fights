import 'package:fights/blocs/fight/fight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fights/blocs/internal/info/info_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
