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

  TutoappAgendaChoiceState({required this.grade, required this.subject});
  @override
  List<Object> get props => [grade, subject];
}

class TutoappCompleteAgendState extends TutoappState {}
