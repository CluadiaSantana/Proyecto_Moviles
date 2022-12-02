import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart_date/dart_date.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proyecto/Repository/tutorias_repository.dart';
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
  List<String> number = [
    "Primero",
    "Segundo",
    "Tercero",
    "Cuarto",
    "Quinto",
    "Sexto"
  ];

  List<String> date_list = ["na"];
  String hour_choice = "Escoge tu horario";
  String date_choice = "Escoge la fecha";
  String hour_start_choice = "0900";
  String hour_end_choice = "2100";
  String grade_choice = "na";
  String subject_choice = "na";
  String role = '';
  final tuto = Tutorias();
  TutoappBloc() : super(TutoappInitial()) {
    on<TutoappSelectGradeEvent>(_showList);
    on<TutoappSelectSubjectEvent>(_navAgenda);
    on<TutoappCompleteAgendEvent>(_addAgenda);
    on<TutoappCancelarEvent>(_cancelar);
    on<TutoappReagendarEvent>(_reagendar);
    on<TutoappZoomEvent>(_goZoom);
    on<TutoappMenuEvent>(_hamburgerMenu);
    on<TutoappRoleEvent>(_rolechoice);
    on<TutoappGoAgendaEvent>(_seeAgenda);
    on<TutoappHomeEvent>(_goHome);
    on<TutoappEditTutoEvent>(_edit);
  }

  FutureOr<void> _showList(
      TutoappSelectGradeEvent event, Emitter<TutoappState> emit) async {
    if (role == '') {
      role = await tuto.role();
    }
    List<String> subject = grade[event.grade]!;
    emit(TutoappListState(subject: subject, grade: event.grade));
  }

  FutureOr<void> _navAgenda(
      TutoappSelectSubjectEvent event, Emitter<TutoappState> emit) {
    grade_choice = number[event.grade - 1];
    subject_choice = event.subject;
    print(role);
    if (role == 'Alumno') {
      print("Alumno");
      date_list.clear();
      for (int i = 0; i <= 4; i++) {
        date_list.add(
            (Date.tomorrow + Duration(days: i + 1)).format('MMMM dd yyyy'));
      }
      emit(TutoappAgendaChoiceState(
          grade: grade_choice,
          subject: subject_choice,
          date: date_choice,
          hour: hour_choice,
          data_list: date_list));
    } else {
      grade_choice = number[event.grade - 1];
      subject_choice = event.subject;
      date_list.clear();
      for (int i = 0; i <= 6; i++) {
        date_list.add((Date.today + Duration(days: i)).format('MMMM dd yyyy'));
      }
      emit(TutoappSelectTutoState(
          grade: grade_choice,
          subject: subject_choice,
          date: date_choice,
          hourStart: hour_start_choice,
          hourEnd: hour_end_choice,
          data_list: date_list));
    }
  }

  FutureOr<void> _addAgenda(
      TutoappCompleteAgendEvent event, Emitter<TutoappState> emit) async {
    var num = await tuto.number_document();
    num = num + 1;
    String name = 'Tutoria' + '-' + num.toString();
    final split = event.hour.split('-');
    if (event.date != 'Escoge la fecha' && event.hour != 'Escoge tu horario') {
      tuto.addTutoria(name, event.date, grade_choice, split, subject_choice,
          event.description);

      tuto.addTutoria(name, event.date, grade_choice, split, subject_choice,
          event.description);
      List<dynamic> tutorias = await tuto.getTuto('alumno');
      if (tutorias.length > 0) {
        emit(TutoappSeeAgendState(tuto_list: tutorias));
      }
    }
    //emit(TutoappSeeAgendState());
  }

  FutureOr<void> _cancelar(
      TutoappCancelarEvent event, Emitter<TutoappState> emit) async {
    print("cancelar");
    tuto.cancelar(event.documento);
    emit(TutoappCancelarState());
    var tutorias = await tuto.getTuto('alumno');
    emit(TutoappSeeAgendState(tuto_list: tutorias));
  }

  FutureOr<void> _reagendar(
      TutoappReagendarEvent event, Emitter<TutoappState> emit) {
    emit(TutoappReagendarState());
  }

  FutureOr<void> _goZoom(
      TutoappZoomEvent event, Emitter<TutoappState> emit) async {
    Uri url = Uri.parse("https://zoom.us");
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  FutureOr<void> _hamburgerMenu(
      TutoappMenuEvent event, Emitter<TutoappState> emit) {
    if (state is TutoappMenuState) {
      Navigator.pop(event.context);
      emit(TutoappInitial());
    } else {
      emit(TutoappMenuState());
    }
  }

  FutureOr<void> _rolechoice(
      TutoappRoleEvent event, Emitter<TutoappState> emit) async {
    role = event.role;
    tuto.update_role(role);
    emit(TutoappHomeState());
  }

  FutureOr<void> _seeAgenda(
      TutoappGoAgendaEvent event, Emitter<TutoappState> emit) async {
    if (role == '') {
      role = await tuto.role();
    }
    var tutorias = await tuto.getTuto(role.toLowerCase());
    print(tutorias);
    emit(TutoappSeeAgendState(tuto_list: tutorias));
  }

  FutureOr<void> _goHome(TutoappHomeEvent event, Emitter<TutoappState> emit) {
    emit(TutoappHomeState());
  }

  FutureOr<void> _edit(TutoappEditTutoEvent event, Emitter<TutoappState> emit) {
    emit(TutoappEditTutoState(documento: event.documento));
  }
}
