import 'dart:async';

import 'package:fights/blocs/internal/chat/chat_bloc.dart';
import 'package:fights/blocs/internal/info/info_bloc.dart';
import 'package:fights/blocs/internal/management/management_bloc.dart';
import 'package:fights/blocs/internal/player/player_bloc.dart';
import 'package:fights/models/phases.dart';
import 'package:fights/models/roles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fight_event.dart';
import 'fight_state.dart';

class FightBloc extends Bloc<FightEvent, FightState> {
  Stream<String> phaseStream;
  StreamSubscription<String> phaseStreamListener;
  String _currentPhase;
  String role;
  FightBloc() : super(InitialFightState());
  ChatBloc chatBloc;
  ManagementBloc managementBloc;
  PlayerBloc playerBloc;
  InfoBloc infoBloc;

  void _init(String role) {
    /// make request here
    this.role = role ?? player;
    _currentPhase = waiting;

    chatBloc = ChatBloc()..add(InitChatEvent());
    switch (this.role) {
      case arbitrator:
        managementBloc = ManagementBloc()..add(InitManagemementEvent());
        break;
      case player:
        playerBloc = PlayerBloc();
        break;
      default:
        break;
    }

    switch (_currentPhase) {
      case waiting:
        infoBloc = InfoBloc();
        break;
      default:
        break;
    }

    this.add(ChangePhaseEvent(_currentPhase));
  }

  @override
  Stream<FightState> mapEventToState(FightEvent event) async* {
    if (event is InitEvent) {
      _init(event.role);
    } else if (event is ChangePhaseEvent) {
      switch (event.phase) {
        case waiting:
          yield WaitingTimeState(role: role);
          break;
        case briefing:
        case beforeRound:
        case round:
        case pause:
        case gamePause:
        case idle:
        case voting:
        case judgeComment:
          yield GameState(role: role);
          break;
        default:
          yield InitialFightState();
      }
    } else if (event is NextPhaseEvent) {
      _currentPhase = phases[phases.indexOf(_currentPhase) + 1 > 8
          ? 0
          : phases.indexOf(_currentPhase) + 1];
      print(phases.indexOf(_currentPhase));
      switch (_currentPhase) {
        case waiting:
          yield WaitingTimeState(role: role);
          break;
        case briefing:
        case beforeRound:
        case round:
        case pause:
        case gamePause:
        case idle:
        case voting:
        case judgeComment:
          yield GameState(role: role);
          break;
        default:
          yield InitialFightState();
      }
    }
  }

  @override
  Future<void> close() {
    phaseStreamListener?.cancel();
    chatBloc?.close();
    managementBloc?.close();
    playerBloc?.close();
    infoBloc?.close();
    return super.close();
  }
}
