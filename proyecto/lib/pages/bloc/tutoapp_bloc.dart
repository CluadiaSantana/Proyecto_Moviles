import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart_date/dart_date.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  //1 Aqui va la lista de la coleccion

  List<String> date_list = ["na"];
  String hour_choice = "Escoge tu horario";
  String date_choice = "Escoge la fecha";
  String grade_choice = "na";
  String subject_choice = "na";
  String role = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TutoappBloc() : super(TutoappInitial()) {
    on<TutoappSelectGradeEvent>(_showList);
    on<TutoappSelectSubjectEvent>(_navAgenda);
    on<TutoappCompleteAgendEvent>(_seeAgenda);
    on<TutoappCancelarEvent>(_cancelar);
    on<TutoappReagendarEvent>(_reagendar);
    on<TutoappZoomEvent>(_goZoom);
    on<TutoappMenuEvent>(_hamburgerMenu);
    on<TutoappRoleEvent>(_rolechoice);
  }

  FutureOr<void> _showList(
      TutoappSelectGradeEvent event, Emitter<TutoappState> emit) async {
    if (role == '') {
      var doc = await FirebaseFirestore.instance
          .collection("usuarios")
          .doc(_auth.currentUser!.uid)
          .get();
      role = doc.data()?['role'];
    }
    List<String> subject = grade[event.grade]!;
    emit(TutoappListState(subject: subject, grade: event.grade));
  }

  FutureOr<void> _navAgenda(
      TutoappSelectSubjectEvent event, Emitter<TutoappState> emit) {
    grade_choice = number[event.grade - 1];
    subject_choice = event.subject;
    date_list.clear();
    for (int i = 0; i <= 4; i++) {
      date_list.add(
          (Date.tomorrow + Duration(days: i + 1)).format('MMMM dd').toString());
      print(date_list[i]);
    }
    emit(TutoappAgendaChoiceState(
        grade: grade_choice,
        subject: subject_choice,
        date: date_choice,
        hour: hour_choice,
        data_list: date_list));
  }

  FutureOr<void> _seeAgenda(
      TutoappCompleteAgendEvent event, Emitter<TutoappState> emit) {
    emit(TutoappSeeAgendState());
  }

  FutureOr<void> _cancelar(
      TutoappCancelarEvent event, Emitter<TutoappState> emit) {
    print("cancelar");
    emit(TutoappCancelarState());
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
    if (state is TutoappMenuStete) {
      Navigator.pop(event.context);
      emit(TutoappInitial());
    } else {
      emit(TutoappMenuStete());
    }
  }

  FutureOr<void> _rolechoice(
      TutoappRoleEvent event, Emitter<TutoappState> emit) async {
    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(_auth.currentUser!.uid)
        .update({'role': event.role});
    role = event.role;
    emit(TutoappHomeStete());
  }
}
