import 'package:flutter/material.dart';
import 'package:proyecto/pages/tutorias/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisponiblesList extends StatelessWidget {
  final Map<String, dynamic> tutoria;
  final List<String> number = [
    "Primero",
    "Segundo",
    "Tercero",
    "Cuarto",
    "Quinto",
    "Sexto"
  ];
  DisponiblesList({Key? key, required this.tutoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TutoappBloc, TutoappState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                tutoria['tutoria']['materia'] +
                                    " " +
                                    (number.indexOf(
                                                tutoria['tutoria']['grado']) +
                                            1)
                                        .toString(),
                                style: TextStyle(
                                    fontFamily: 'Chewy-Regular',
                                    fontSize: 20,
                                    color: Colors.amber[600]!),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(children: [
                                  Text(
                                    tutoria['tutoria']['horaInicio'] +
                                        '-' +
                                        tutoria['tutoria']['horaFin'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.green[600],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    tutoria['tutoria']['fecha'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.green[600],
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                              Text(
                                tutoria['tutoria']['ayuda'],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                _Agendar(context);
                              },
                              child: Text("Agendar"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[400],
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(thickness: 2, color: Colors.blue[400]),
                ],
              )),
        );
      },
    );
  }

  Future<dynamic> _Agendar(context) {
    var _zoom = TextEditingController();
    return showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                insetPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: Text('Agendar Tutoria',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.amber[600],
                        fontWeight: FontWeight.bold)),
                content: Container(
                  padding: const EdgeInsets.all(5),
                  width: 50,
                  height: 150,
                  child: Column(children: [
                    Text(
                      'La tutoria se agendara \n ¿Quieres continuar?',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: _zoom,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Link a zoom'),
                      ),
                    ),
                  ]),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'CANCELAR',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<TutoappBloc>(context).add(
                          TutoappAcceptTutoEvent(
                              documento: tutoria, zoom: _zoom.value.text));
                    },
                    child: Text('ACCEPTAR',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                ],
              );
            }));
  }
}
