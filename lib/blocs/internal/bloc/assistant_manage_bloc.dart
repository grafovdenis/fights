import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'assistant_manage_event.dart';
part 'assistant_manage_state.dart';

class AssistantManageBloc extends Bloc<AssistantManageEvent, AssistantManageState> {
  AssistantManageBloc() : super(AssistantManageInitial());

  @override
  Stream<AssistantManageState> mapEventToState(
    AssistantManageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
