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
  String grade_choice = "na";
  String subject_choice = "na";
  String hourI = "0900";
  String hourf = "2100";
  String role = '';
  List<Map<String, dynamic>> tutorias_agendadas = [];

  final tuto = Tutorias();
  TutoappBloc() : super(TutoappInitial()) {
    on<TutoappSelectGradeEvent>(_showList);
    on<TutoappSelectSubjectEvent>(_navAgenda);
    on<TutoappCompleteAgendEvent>(_addAgenda);
    on<TutoappCancelarEvent>(_cancelar);
    on<TutoappZoomEvent>(_goZoom);
    on<TutoappRoleEvent>(_rolechoice);
    on<TutoappGoAgendaEvent>(_seeAgenda);
    on<TutoappHomeEvent>(_goHome);
    on<TutoappEditTutoEvent>(_edit);
    on<TutoappUpdateTutoEvent>(_update);
    on<TutoappAcceptTutoEvent>(_accept);
  }

  FutureOr<void> _showList(
      TutoappSelectGradeEvent event, Emitter<TutoappState> emit) async {
    role = await tuto.role();

    List<String> subject = grade[event.grade]!;
    emit(TutoappListState(subject: subject, grade: event.grade));
  }

  FutureOr<void> _navAgenda(
      TutoappSelectSubjectEvent event, Emitter<TutoappState> emit) async {
    tutorias_agendadas = await tuto.getTuto(role.toLowerCase());
    print(role);
    if (role == 'Alumno') {
      if (tutorias_agendadas.length < 5) {
        grade_choice = number[event.grade - 1];
        subject_choice = event.subject;

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
        emit(TutoappExcededState());
      }
    } else {
      grade_choice = number[event.grade - 1];
      subject_choice = event.subject;
      date_list.clear();
      for (int i = 0; i <= 6; i++) {
        date_list
            .add(((Date.today + Duration(days: i)).format('MMMM dd yyyy')));
      }
      hourI = "0900";
      hourf = "2100";
      List<Map<String, dynamic>> tutorias_disponibles =
          await tuto.getTutoSearch(date_list[0], date_list[6], hourI, hourf,
              subject_choice, grade_choice);
      emit(TutoappSelectTutoState(
          grade: grade_choice,
          subject: subject_choice,
          date: date_list[0],
          hourStart: hourI,
          hourEnd: hourf,
          data_list: tutorias_disponibles));
    }
  }

  FutureOr<void> _addAgenda(
      TutoappCompleteAgendEvent event, Emitter<TutoappState> emit) async {
    var num = await tuto.number_document();
    num = num + 1;
    String name = 'Tutoria' + '-' + num.toString();
    if ((event.date != 'Escoge la fecha') &&
        (event.hour != 'Escoge tu horario')) {
      final split = event.hour.split('-');
      for (dynamic tutoriad in tutorias_agendadas) {
        if (tutoriad["tutoria"]["horaInicio"] == split[0] &&
            event.date == tutoriad["tutoria"]["fecha"]) {
          emit(TutoappErrorHoraState());
          emit(TutoappAgendaChoiceState(
              grade: grade_choice,
              subject: subject_choice,
              date: date_choice,
              hour: hour_choice,
              data_list: date_list));
          return;
        }
      }
      tuto.addTutoria(name, event.date, grade_choice, split, subject_choice,
          event.description);

      tuto.addTutoria(name, event.date, grade_choice, split, subject_choice,
          event.description);
      List<dynamic> tutorias = await tuto.getTuto('alumno');
      if (tutorias.length > 0) {
        emit(TutoappSeeAgendState(tuto_list: tutorias, role: role));
      } else {
        List<dynamic> tuto_list = [];
        emit(TutoappSeeAgendState(tuto_list: tuto_list, role: role));
      }
    } else {
      emit(TutoappErrorAgendaState());
      emit(TutoappAgendaChoiceState(
          grade: grade_choice,
          subject: subject_choice,
          date: date_choice,
          hour: hour_choice,
          data_list: date_list));
    }
  }

  FutureOr<void> _cancelar(
      TutoappCancelarEvent event, Emitter<TutoappState> emit) async {
    print("cancelar");
    tuto.cancelar(event.documento);
    emit(TutoappCancelarState());
    var tutorias = await tuto.getTuto('alumno');
    emit(TutoappSeeAgendState(tuto_list: tutorias, role: role));
  }

  FutureOr<void> _goZoom(
      TutoappZoomEvent event, Emitter<TutoappState> emit) async {
    Uri url = Uri.parse("https://zoom.us");
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  FutureOr<void> _rolechoice(
      TutoappRoleEvent event, Emitter<TutoappState> emit) async {
    role = event.role;
    tuto.update_role(role);
  }

  FutureOr<void> _seeAgenda(
      TutoappGoAgendaEvent event, Emitter<TutoappState> emit) async {
    role = await tuto.role();

    var tutorias = await tuto.getTuto(role.toLowerCase());
    print(tutorias);
    emit(TutoappSeeAgendState(tuto_list: tutorias, role: role));
  }

  FutureOr<void> _goHome(TutoappHomeEvent event, Emitter<TutoappState> emit) {
    emit(TutoappHomeState());
  }

  FutureOr<void> _edit(TutoappEditTutoEvent event, Emitter<TutoappState> emit) {
    emit(TutoappEditTutoState(documento: event.documento));
  }

  FutureOr<void> _update(
      TutoappUpdateTutoEvent event, Emitter<TutoappState> emit) async {
    print(event.help);
    Map<String, dynamic> document = event.documento;
    document['tutoria']['ayuda'] = event.help;
    tuto.update_edit(document);
    var tutorias = await tuto.getTuto(role.toLowerCase());
    emit(TutoappSeeAgendState(tuto_list: tutorias, role: role));
  }

  FutureOr<void> _accept(
      TutoappAcceptTutoEvent event, Emitter<TutoappState> emit) {
    tuto.addTutor(event.documento['documento'], event.zoom);
  }
}
