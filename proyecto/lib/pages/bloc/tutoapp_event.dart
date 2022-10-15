part of 'tutoapp_bloc.dart';

@immutable
abstract class TutoappEvent {}

class TutoappSelectGradeEvent extends TutoappEvent {
  final int grade;

  TutoappSelectGradeEvent({required this.grade});
}
