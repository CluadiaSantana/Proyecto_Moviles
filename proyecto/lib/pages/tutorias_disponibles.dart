import 'package:flutter/material.dart';

class TutoriasDisponibles extends StatelessWidget {
  const TutoriasDisponibles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TutoApp - Tutorias Disponibles",
          style: TextStyle(
              fontFamily: 'Chewy-Regular',
              fontSize: 24,
              color: Colors.amber[600]),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Icon(
                Icons.account_circle_rounded,
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            espacioTutoria(
                "Primero de Primaria", "Matematicas", "11:00 - 11:30"),
            espacioTutoria("Primero de Primaria", "Historia", "11:30 - 12:00"),
            espacioTutoria("primero de Primaria", "Español", "12:00 - 12:30"),
            espacioTutoria("Primero de Primaria", "Arte", "12:30 - 13:00"),
            espacioTutoria("Primero de Primaria", "Historia", "13:00 - 13:30"),
            espacioTutoria(
                "Primero de Primaria", "Matematicas", "13:30 - 14:00"),
            espacioTutoria("Primero de Primaria", "Español", "14:00 - 14:30"),
          ],
        ),
      ),
    );
  }

  Container espacioTutoria(String Grade, String Subject, String Time) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  Grade,
                  style: TextStyle(
                      fontFamily: 'Chewy-Regular',
                      fontSize: 24,
                      color: Colors.amber[600]),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text(
                  Subject,
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 10),
                child: Text(
                  Time,
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
