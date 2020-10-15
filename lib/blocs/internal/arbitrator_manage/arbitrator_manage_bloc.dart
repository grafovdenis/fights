import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'arbitrator_manage_event.dart';
part 'arbitrator_manage_state.dart';

class ArbitratorManageBloc
    extends Bloc<ArbitratorManageEvent, ArbitratorManageState> {
  ArbitratorManageBloc() : super(ArbitratorManageInitial());

  @override
  Stream<ArbitratorManageState> mapEventToState(
    ArbitratorManageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
