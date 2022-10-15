import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'tutoapp_event.dart';
part 'tutoapp_state.dart';

class TutoappBloc extends Bloc<TutoappEvent, TutoappState> {
  Map<int, List<String>> grade = {
    1: ["Español", "Matematicaas"],
    2: ["Ingles", "Historia"],
    3: ["Matematicas", "Educacion Artistica"],
    4: ["Matematicas", "Ciencias Naturales"],
    5: ["Historia", "Geografia"],
    6: ["Ingles", "Geografia", "Español"]
  };
  TutoappBloc() : super(TutoappInitial()) {
    on<TutoappSelectGradeEvent>(_showList);
  }

  FutureOr<void> _showList(
      TutoappSelectGradeEvent event, Emitter<TutoappState> emit) {
    List<String> subject = grade[event.grade]!;
    print("evento");
    emit(TutoappListState(subject: subject));
  }
}
