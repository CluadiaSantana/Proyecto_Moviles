import 'package:flutter/material.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Agenda extends StatelessWidget {
  Agenda({
    Key? key,
  }) : super(key: key);
  final List<String> horario = [
    '0900 - 1100',
    '1100 - 1300',
    '1300 - 1500',
    '1500 - 1700',
    '1700 - 1900',
    '1900 - 2100'
  ];

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
        body: BlocConsumer<TutoappBloc, TutoappState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                _tutoAg(context, "Primero-Matematicas", "2:00 - 2:30 PM",
                    Colors.amber[600]!),
                Divider(thickness: 2, color: Colors.green[400]),
                _tutoAg(context, "Tercero-Formacion Civica y Etica",
                    "2:00 - 2:30 PM", Colors.lightGreen[600]!),
                Divider(thickness: 2, color: Colors.green[400]),
                _tutoAg(context, "Primero-Español", "2:00 - 2:30 PM",
                    Colors.amber[600]!),
                Divider(thickness: 2, color: Colors.green[400]),
                _tutoAg(context, "Primero-Lectura", "2:00 - 2:30 PM",
                    Colors.amber[600]!),
                Divider(thickness: 2, color: Colors.green[400]),
                _tutoAg(context, "Quinto-Ingles", "2:00 - 2:30 PM",
                    Colors.lightBlue[600]!),
                Divider(thickness: 2, color: Colors.green[400]),
              ],
            );
          },
        ));
  }

  Row _tutoAg(context, String title, String horario, Color col) {
    return Row(
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
                  title,
                  style: TextStyle(
                      fontFamily: 'Chewy-Regular', fontSize: 24, color: col),
                ),
              ),
              Text(
                horario,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.green[600],
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: (() {
              BlocProvider.of<TutoappBloc>(context).add(TutoappZoomEvent());
            }),
            icon: Image.asset('assets/images/zoom.png')),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Reagendar tutoria',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Chewy-Regular',
                                    color: Colors.blue),
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
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Text(
                                            horario,
                                            style: TextStyle(
                                                fontFamily: 'Chewy-Regular',
                                                fontSize: 20,
                                                color: Colors.amber[600]),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                Divider(
                                          thickness: 1,
                                          color: Colors.pink[100],
                                          indent: 5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    child: const Text('Aceptar'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text('Cancelar'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
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
                onPressed: () {
                  _cancelQuestion(context);
                },
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
      ],
    );
  }

  Future<dynamic> _cancelQuestion(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Cancelar tutoria"),
            content: Text(
              'La tutoria sera cancelada \n ¿Quieres continuar?',
              style: TextStyle(fontSize: 12),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'CANCEL',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<TutoappBloc>(context)
                      .add(TutoappCancelarEvent());
                },
                child: Text('ACCEPT',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
              ),
            ],
          );
        });
  }
}
