import 'package:flutter/material.dart';
import 'package:fights/blocs/internal/situation/situation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SituationWidget extends StatelessWidget {
  const SituationWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SituationBloc, SituationState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
