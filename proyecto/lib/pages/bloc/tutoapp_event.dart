part of 'tutoapp_bloc.dart';

@immutable
abstract class TutoappEvent extends Equatable {
  const TutoappEvent();
  @override
  List<Object> get props => [];
}

class TutoappReagendarEvent extends TutoappEvent {}

class TutoappZoomEvent extends TutoappEvent {}

class TutoappCancelarEvent extends TutoappEvent {}

class TutoappSelectGradeEvent extends TutoappEvent {
  final int grade;

  TutoappSelectGradeEvent({required this.grade});

  @override
  List<Object> get props => [grade];
}

class TutoappSelectSubjectEvent extends TutoappEvent {
  final int grade;
  final String subject;

  TutoappSelectSubjectEvent({required this.grade, required this.subject});

  @override
  List<Object> get props => [grade, subject];
}

class TutoappCompleteAgendEvent extends TutoappEvent {
  final String hour;
  final String date;
  final String description;

  TutoappCompleteAgendEvent(
      {required this.hour, required this.date, required this.description});

  @override
  List<Object> get props => [hour, date, description];
}

class TutoAppSingInEvent extends TutoappEvent {
  final String correo;
  final String password;

  TutoAppSingInEvent({required this.correo, required this.password});

  @override
  List<Object> get props => [correo, password];
}

class TutoappMenuEvent extends TutoappEvent {
  final BuildContext context;

  TutoappMenuEvent({required this.context});
}

class TutoappRoleEvent extends TutoappEvent {
  final String role;

  TutoappRoleEvent({required this.role});
}
