import 'package:flutter/foundation.dart';

abstract class FightState {
  FightState copyWith;
  String role;
  String phase;
}

class InitialFightState extends FightState {}

class WaitingTimeState extends FightState {
  @override
  final String role;

  WaitingTimeState({
    @required this.role,
  });
}

class GameState extends FightState {
  @override
  final String role;

  @override
  final String phase;

  GameState({
    @required this.role,
    @required this.phase,
  });
}
