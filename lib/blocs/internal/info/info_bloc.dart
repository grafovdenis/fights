import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial());

  @override
  Stream<InfoState> mapEventToState(
    InfoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
