import 'package:flutter/material.dart';

class AgendarTutoria extends StatelessWidget {
  AgendarTutoria({super.key});
  final List<String> clases = [
    'Primero',
    'Segundo',
    'Tercero',
    'Cuarto',
    'Quinto',
    'Sexto'
  ];
  final List<String> horario = [
    '0900 - 1100',
    '1100 - 1300',
    '1300 - 1500',
    '1500 - 1700',
    '1700 - 1900',
    '1900 - 2100'
  ];

  //final List<String> colores = ['amber[600]','blue[600]','lightGreen[600]','cyan[600]','purple[600]','orange[600]'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "TutoApp - Agenda Una Tutoria",
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
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Grado",
                    style: TextStyle(
                        fontFamily: 'Chewy-Regular',
                        fontSize: 32,
                        color: Colors.blue[600]),
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 400,
                          child: ListView.separated(
                            padding: EdgeInsets.all(10),
                            itemCount: clases.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                clases[index],
                                style: TextStyle(
                                    fontFamily: 'Chewy-Regular',
                                    fontSize: 24,
                                    color: Colors.amber[600]),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(
                              thickness: 1,
                              color: Colors.pink[100],
                              indent: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Text(
                    "Horario",
                    style: TextStyle(
                        fontFamily: 'Chewy-Regular',
                        fontSize: 32,
                        color: Colors.blue[600]),
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 400,
                          child: ListView.separated(
                            padding: EdgeInsets.all(10),
                            itemCount: horario.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                horario[index],
                                style: TextStyle(
                                    fontFamily: 'Chewy-Regular',
                                    fontSize: 24,
                                    color: Colors.amber[600]),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(
                              thickness: 1,
                              color: Colors.pink[100],
                              indent: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "En Que Necesitas Ayuda?",
                    style: TextStyle(
                        fontFamily: 'Chewy-Regular',
                        fontSize: 32,
                        color: Colors.blue[600]),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Escribe una breve descripcion de tus dudas'),
                ),
              ]),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Agendar Tutoria"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
