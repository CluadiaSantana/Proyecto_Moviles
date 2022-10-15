import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'tutoapp_event.dart';
part 'tutoapp_state.dart';

class TutoappBloc extends Bloc<TutoappEvent, TutoappState> {
  Map<int, List<String>> grade = {
    1: [
      "Español",
      "Matemáticas",
      "Exploración de la Naturaleza y la Sociedad",
      "Formación Cívica y Ética",
      "Educación Artística"
    ],
    2: [
      "Español",
      "Matemáticas",
      "Exploración de la Naturaleza y la Sociedad",
      "Formación Cívica y Ética",
      "Educación Artística"
    ],
    3: [
      "Español",
      "Matemáticas",
      "Ciencias Naturales",
      "La Entidad donde vivo",
      "Formación Cívica y Ética",
      "Educación Artística"
    ],
    4: [
      "Español",
      "Matemáticas",
      "Ciencias Naturales",
      "Geografía",
      "Historia",
      "Formación Cívica y Ética",
      "Educación Artística"
    ],
    5: [
      "Español",
      "Matemáticas",
      "Ciencias Naturales",
      "Geografía",
      "Historia",
      "Formación Cívica y Ética",
      "Educación Artística"
    ],
    6: [
      "Español",
      "Matemáticas",
      "Ciencias Naturales",
      "Geografía",
      "Historia",
      "Formación Cívica y Ética",
      "Educación Artística"
    ]
  };
  TutoappBloc() : super(TutoappInitial()) {
    on<TutoappSelectGradeEvent>(_showList);
  }

  FutureOr<void> _showList(
      TutoappSelectGradeEvent event, Emitter<TutoappState> emit) {
    List<String> subject = grade[event.grade]!;
    print("evento");
    emit(TutoappListState(subject: subject, grade: event.grade));
  }
}
