part of 'tutoapp_bloc.dart';

@immutable
abstract class TutoappState {}

class TutoappInitial extends TutoappState {}

class TutoappListState extends TutoappState {
  final List<String> subject;

  TutoappListState({required this.subject});
}
