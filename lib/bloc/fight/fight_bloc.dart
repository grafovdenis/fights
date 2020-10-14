import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'fight_event.dart';
import 'fight_state.dart';

const phases = [
  "waiting",
  "briefing",
  "beforeRound",
  "round",
  "pause",
  "gamePause",
  "idle",
  "voting",
  "judgeComment",
];

const roles = [
  "arbitrator",
  "player",
  "second",
  "judge",
  "spectator",
];

class FightBloc extends Bloc<FightEvent, FightState> {
  Stream<String> phaseStream;
  StreamSubscription<String> phaseStreamListener;
  String _currentPhase;
  String role;
  FightBloc() : super(InitialFightState());

  void _init(String role) {
    /// MOCK init stream
    phaseStream = Stream.periodic(const Duration(seconds: 5), (t) {
      return phases[t % phases.length];
    });

    this.role = role ?? "player";

    ///subscribe to phase stream
    // phaseStreamListener = phaseStream.listen((_phase) {
    //   print(_phase);
    //   _currentPhase = _phase;
    //   this.add(ChangePhaseEvent(_currentPhase));
    // });

    _currentPhase = "waiting";
    this.add(ChangePhaseEvent(_currentPhase));
  }

  @override
  Stream<FightState> mapEventToState(FightEvent event) async* {
    if (event is InitEvent) {
      _init(event.role);
    } else if (event is ChangePhaseEvent) {
      switch (event.phase) {
        case "waiting":
          yield WaitingTimeState(role: role);
          break;
        case "briefing":
          yield BriefingState(role: role);
          break;
        case "beforeRound":
          yield BeforeRoundState(role: role);
          break;
        case "round":
          yield RoundState(role: role);
          break;
        case "pause":
          yield PauseState(role: role);
          break;
        case "gamePause":
          yield GamePauseState(role: role);
          break;
        case "idle":
          yield IdleState(role: role);
          break;
        case "voting":
          yield VotingState(role: role);
          break;
        case "judgeComment":
          yield JudgeCommentState(role: role);
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
        case "waiting":
          yield WaitingTimeState(role: role);
          break;
        case "briefing":
          yield BriefingState(role: role);
          break;
        case "beforeRound":
          yield BeforeRoundState(role: role);
          break;
        case "round":
          yield RoundState(role: role);
          break;
        case "pause":
          yield PauseState(role: role);
          break;
        case "gamePause":
          yield GamePauseState(role: role);
          break;
        case "idle":
          yield IdleState(role: role);
          break;
        case "voting":
          yield VotingState(role: role);
          break;
        case "judgeComment":
          yield JudgeCommentState(role: role);
          break;
        default:
          yield InitialFightState();
      }
    }
  }

  @override
  Future<void> close() {
    phaseStreamListener?.cancel();
    return super.close();
  }
}
