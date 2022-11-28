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

class TutoappSeeAgendState extends TutoappState {}

class TutoappReagendarState extends TutoappState {}

class TutoappCancelarState extends TutoappState {}

class TutoappStudentStete extends TutoappState {}

class TutoappTutorStete extends TutoappState {}

class TutoappMenuStete extends TutoappState {}

class TutoappHomeStete extends TutoappState {}
