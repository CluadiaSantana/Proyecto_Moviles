part of 'tutoapp_bloc.dart';

@immutable
abstract class TutoappEvent extends Equatable {
  const TutoappEvent();
  @override
  List<Object> get props => [];
}

class TutoappZoomEvent extends TutoappEvent {}

class TutoappGoAgendaEvent extends TutoappEvent {}

class TutoappCancelarEvent extends TutoappEvent {
  final String documento;

  TutoappCancelarEvent({required this.documento});
}

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

class TutoappEditTutoEvent extends TutoappEvent {
  final Map<String, dynamic> documento;

  TutoappEditTutoEvent({required this.documento});
}

class TutoappUpdateTutoEvent extends TutoappEvent {
  final Map<String, dynamic> documento;
  final String help;

  TutoappUpdateTutoEvent({required this.documento, required this.help});
}

class TutoappHomeEvent extends TutoappEvent {}

class TutoappAcceptTutoEvent extends TutoappEvent {
  final Map<String, dynamic> documento;
  final String zoom;

  TutoappAcceptTutoEvent({required this.documento, required this.zoom});
}

class TutoappFiltrarEvent extends TutoappEvent {
  final String hourI;
  final String hourF;
  final String dateI;
  final String dateF;

  TutoappFiltrarEvent(
      {required this.hourI,
      required this.hourF,
      required this.dateI,
      required this.dateF});
}
