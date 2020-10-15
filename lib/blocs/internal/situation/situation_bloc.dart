import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'situation_event.dart';
part 'situation_state.dart';

class SituationBloc extends Bloc<SituationEvent, SituationState> {
  SituationBloc() : super(SituationInitial());

  @override
  Stream<SituationState> mapEventToState(
    SituationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
