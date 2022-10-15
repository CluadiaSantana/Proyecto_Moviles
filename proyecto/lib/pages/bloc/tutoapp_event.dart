part of 'tutoapp_bloc.dart';

@immutable
abstract class TutoappEvent extends Equatable {}

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
  final String horario;

  TutoappCompleteAgendEvent({required this.horario});

  @override
  List<Object> get props => [horario];
}
