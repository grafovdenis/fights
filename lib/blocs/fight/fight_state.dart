import 'package:flutter/foundation.dart';

abstract class FightState {
  FightState copyWith;
  String role;
}

class InitialFightState extends FightState {}

class WaitingTimeState extends FightState {
  @override
  final String role;

  WaitingTimeState({
    @required this.role,
  });
}

class BriefingState extends FightState {
  @override
  final String role;

  BriefingState({
    @required this.role,
  });
}

class BeforeRoundState extends FightState {
  @override
  final String role;

  BeforeRoundState({
    @required this.role,
  });
}

class RoundState extends FightState {
  @override
  final String role;

  RoundState({
    @required this.role,
  });
}

class PauseState extends FightState {
  @override
  final String role;

  PauseState({
    @required this.role,
  });
}

class GamePauseState extends FightState {
  @override
  final String role;

  GamePauseState({
    @required this.role,
  });
}

class IdleState extends FightState {
  @override
  final String role;

  IdleState({
    @required this.role,
  });
}

class VotingState extends FightState {
  @override
  final String role;

  VotingState({
    @required this.role,
  });
}

class JudgeCommentState extends FightState {
  @override
  final String role;

  JudgeCommentState({
    @required this.role,
  });
}

class GameState extends FightState {
  @override
  final String role;

  GameState({
    @required this.role,
  });
}
