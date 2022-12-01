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

  Future<List<dynamic>> getTuto(String user) async {
    var tutorias =
        await FirebaseFirestore.instance.collection("Tutorias").get();
    var today = (Date.today + Duration(days: 3)).format('MMMM dd yyyy');
    var hour = Date.today.format('HH') + '00';
    var tutorias_list = tutorias.docs
        .where((doc) =>
            doc.data()[user] == _auth.currentUser!.uid &&
            DateFormat('MMMM dd yyyy').parse(today) <=
                DateFormat('MMMM dd yyyy')
                    .parse(doc.data()['tutoria']['fecha']) &&
            int.parse(hour) <= int.parse(doc.data()['tutoria']['horaFin']) &&
            doc.data()['tutor'] != 'null' &&
            doc.data()['activate'])
        .map((doc) => doc.data().cast<String, dynamic>())
        .toList();
    return tutorias_list;
  }
}
