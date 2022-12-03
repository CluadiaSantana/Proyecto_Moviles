part of 'tutoapp_bloc.dart';

@immutable
abstract class TutoappState extends Equatable {
  const TutoappState();
  @override
  List<Object> get props => [];
}

class TutoappInitial extends TutoappState {}

class TutoappListState extends TutoappState {
  final List<String> subject;
  final int grade;
  TutoappListState({required this.subject, required this.grade});
  @override
  List<Object> get props => [grade, subject];
}

class TutoappAgendaChoiceState extends TutoappState {
  final String grade;
  final String subject;
  final String date;
  final String hour;
  final List<String> data_list;

  TutoappAgendaChoiceState(
      {required this.grade,
      required this.subject,
      required this.date,
      required this.hour,
      required this.data_list});
  @override
  List<Object> get props => [grade, subject, date, hour, data_list];
}

class TutoappSeeAgendState extends TutoappState {
  final List<dynamic> tuto_list;

  TutoappSeeAgendState({required this.tuto_list});
}

class TutoappReagendarState extends TutoappState {}

class TutoappCancelarState extends TutoappState {}

class TutoappSelectTutoState extends TutoappState {
  final String grade;
  final String subject;
  final String date;
  final String hourStart;
  final String hourEnd;
  final List<String> data_list;

  TutoappSelectTutoState(
      {required this.grade,
      required this.subject,
      required this.date,
      required this.hourStart,
      required this.hourEnd,
      required this.data_list});
  @override
  List<Object> get props =>
      [grade, subject, date, hourStart, hourEnd, data_list];
}

class TutoappMenuState extends TutoappState {}

class TutoappHomeState extends TutoappState {}

class TutoappExcededState extends TutoappState {}

class TutoappEditTutoState extends TutoappState {
  final Map<String, dynamic> documento;

  TutoappEditTutoState({required this.documento});
}

class TutoappErrorAgendaState extends TutoappState {}
