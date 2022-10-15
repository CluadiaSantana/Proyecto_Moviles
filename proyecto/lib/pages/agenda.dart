import 'package:flutter/material.dart';

class Agenda extends StatelessWidget {
  const Agenda({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "TutoApp - Tutorias",
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Primero-Matematicas",
                          style: TextStyle(
                              fontFamily: 'Chewy-Regular',
                              fontSize: 24,
                              color: Colors.amber[600]),
                        ),
                      ),
                      Text(
                        "2:00 - 2:30 PM",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Reagendar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            Divider(thickness: 2, color: Colors.green[400]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Tercero-Formacion Civica y Etica",
                          style: TextStyle(
                              fontFamily: 'Chewy-Regular',
                              fontSize: 24,
                              color: Colors.lightGreen[600]),
                        ),
                      ),
                      Text(
                        "2:00 - 2:30 PM",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Reagendar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            Divider(thickness: 2, color: Colors.green[400]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Primero-Español",
                          style: TextStyle(
                              fontFamily: 'Chewy-Regular',
                              fontSize: 24,
                              color: Colors.amber[600]),
                        ),
                      ),
                      Text(
                        "2:00 - 2:30 PM",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Reagendar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            Divider(thickness: 2, color: Colors.green[400]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Primero-Lectura",
                          style: TextStyle(
                              fontFamily: 'Chewy-Regular',
                              fontSize: 24,
                              color: Colors.amber[600]),
                        ),
                      ),
                      Text(
                        "2:00 - 2:30 PM",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Reagendar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            Divider(thickness: 2, color: Colors.green[400]),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Quinto-Ingles",
                          style: TextStyle(
                              fontFamily: 'Chewy-Regular',
                              fontSize: 24,
                              color: Colors.lightBlue[600]),
                        ),
                      ),
                      Text(
                        "2:00 - 2:30 PM",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Reagendar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      textStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            Divider(thickness: 2, color: Colors.green[400]),
          ],
        ));
  }
}
