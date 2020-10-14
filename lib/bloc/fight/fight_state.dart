import 'package:flutter/foundation.dart';

abstract class FightState {
  FightState copyWith;
}

class InitialFightState extends FightState {}

class WaitingTimeState extends FightState {
  final String role;

  WaitingTimeState({
    @required this.role,
  });
}

class BriefingState extends FightState {
  final String role;

  BriefingState({
    @required this.role,
  });
}

class RoundState extends FightState {
  final String role;

  RoundState({
    @required this.role,
  });
}

class PauseState extends FightState {
  final String role;

  PauseState({
    @required this.role,
  });
}

class GamePauseState extends FightState {
  final String role;

  GamePauseState({
    @required this.role,
  });
}

class IdleState extends FightState {
  final String role;

  IdleState({
    @required this.role,
  });
}

class VotingState extends FightState {
  final String role;

  VotingState({
    @required this.role,
  });
}

class JudgeCommentState extends FightState {
  final String role;

  JudgeCommentState({
    @required this.role,
  });
}
