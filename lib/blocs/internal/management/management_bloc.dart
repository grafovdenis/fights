import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'management_event.dart';
part 'management_state.dart';

class ManagementBloc extends Bloc<ManagementEvent, ManagementState> {
  ManagementBloc() : super(ManagementInitial());

  void _init() {}

  @override
  Stream<ManagementState> mapEventToState(ManagementEvent event) async* {
    if (event is InitManagemementEvent) {
      _init();
      yield ManagementInitializedState();
    }
  }
}
