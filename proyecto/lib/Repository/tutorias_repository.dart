import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:dart_date/dart_date.dart';

class Tutorias {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> role() async {
    var doc = await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(_auth.currentUser!.uid)
        .get();
    String role = doc.data()?['role'];
    return role;
  }

  void addTutoria(
      name, date, grade_choice, split, subject_choice, description) async {
    await FirebaseFirestore.instance.collection("Tutorias").doc(name).set(
      {
        'alumno': _auth.currentUser!.uid,
        'tutor': 'null',
        'zoom': 'null',
        'documento': name,
        'activate': true,
        'tutoria': {
          'fecha': date,
          'grado': grade_choice,
          'horaFin': split[1],
          'horaInicio': split[0],
          'materia': subject_choice,
          'ayuda': description
        },
      },
    );
  }

  Future<List<Map<String, dynamic>>> getTuto(String user) async {
    var tutorias =
        await FirebaseFirestore.instance.collection("Tutorias").get();
    var today = Date.today.format('MMMM dd yyyy HH');
    List<Map<String, dynamic>> tutorias_list = tutorias.docs
        .where((doc) =>
            doc.data()[user] == _auth.currentUser!.uid &&
            DateFormat('MMMM dd yyyy HH').parse(today) <=
                DateFormat('MMMM dd yyyy HH').parse(
                    date_comparacion(doc.data()['tutoria'], 'horaFin')) &&
            doc.data()['activate'])
        .map((doc) => doc.data().cast<String, dynamic>())
        .toList();
    tutorias_list = sort_list(tutorias_list);
    return tutorias_list;
  }

  Future<List<Map<String, dynamic>>> getTutoSearch(
      String date_start,
      String date_end,
      String start,
      String end,
      String subject,
      String grade) async {
    var tutorias =
        await FirebaseFirestore.instance.collection("Tutorias").get();
    var tutorias_list = tutorias.docs
        .where((doc) =>
            DateFormat('MMMM dd yyyy').parse(date_start) <=
                DateFormat('MMMM dd yyyy')
                    .parse(doc.data()['tutoria']['fecha']) &&
            DateFormat('MMMM dd yyyy').parse(date_end) >=
                DateFormat('MMMM dd yyyy')
                    .parse(doc.data()['tutoria']['fecha']) &&
            int.parse(start) <=
                int.parse(doc.data()['tutoria']['horaInicio']) &&
            int.parse(end) >= int.parse(doc.data()['tutoria']['horaFin']) &&
            doc.data()['tutoria']['materia'] == subject &&
            doc.data()['tutoria']['grado'] == grade &&
            doc.data()['activate'])
        .map((doc) => doc.data().cast<String, dynamic>())
        .toList();
    return tutorias_list;
  }

  void cancelar(String documento) async {
    await FirebaseFirestore.instance
        .collection("Tutorias")
        .doc(documento)
        .update({'activate': false});
  }

  Future<int> number_document() async {
    var num = await FirebaseFirestore.instance
        .collection("Tutorias")
        .get()
        .then((snap) => snap.size);
    return num;
  }

  static List<Map<String, dynamic>> sort_list(
      List<Map<String, dynamic>> lista) {
    lista.sort(((a, b) => DateFormat('MMMM dd yyyy HH')
        .parse(date_comparacion(a['tutoria'], 'horaInicio'))
        .compareTo(DateFormat('MMMM dd yyyy HH')
            .parse(date_comparacion(b['tutoria'], 'horaInicio')))));
    return lista;
  }

  static String date_comparacion(Map<String, dynamic> a, String hour) {
    var fecha = a['fecha'] + " " + a[hour].substring(0, 2);
    return fecha;
  }

  void update_role(String role) async {
    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(_auth.currentUser!.uid)
        .update({'role': role});
  }

  void update_edit(Map<String, dynamic> description) async {
    await FirebaseFirestore.instance
        .collection("Tutorias")
        .doc(description["documento"])
        .update({'tutoria': description['tutoria']});
  }

  void addTutor(String zoom) async {
    await FirebaseFirestore.instance
        .collection("Tutorias")
        .doc(_auth.currentUser!.uid)
        .update({'tutor': _auth.currentUser!.uid, 'zoom': zoom});
  }

  Future<int> number_tutorias(String user) async {
    var num = await getTuto(user).then((snap) => snap.length);
    return num;
  }
}
