abstract class FightEvent {}

class InitEvent extends FightEvent {
  final String role;

  InitEvent({this.role});
}

class ChangePhaseEvent extends FightEvent {
  final String phase;

  ChangePhaseEvent(this.phase);
}

class NextPhaseEvent extends FightEvent {}
