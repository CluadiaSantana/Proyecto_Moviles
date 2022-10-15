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
                    "Primero de Primaria",
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
                    "Matematicas",
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
                    "13:00 - 13:30",
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
                  ),
                )
              ],
            ),
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
                    "Segundo de Primaria",
                    style: TextStyle(
                        fontFamily: 'Chewy-Regular',
                        fontSize: 24,
                        color: Colors.blue[600]),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    "Historia",
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
                    "13:00 - 13:30",
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
                  ),
                )
              ],
            ),
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
                    "Tercero de Primaria",
                    style: TextStyle(
                        fontFamily: 'Chewy-Regular',
                        fontSize: 24,
                        color: Colors.green[600]),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    "Ciencias Naturales",
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
                    "13:00 - 13:30",
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
                  ),
                )
              ],
            ),
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
                    "Quinto de Primaria",
                    style: TextStyle(
                        fontFamily: 'Chewy-Regular',
                        fontSize: 24,
                        color: Colors.purple[600]),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    "Español",
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
                    "1:00 - 13:30",
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
