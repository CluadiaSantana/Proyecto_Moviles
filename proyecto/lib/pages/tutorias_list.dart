import 'package:flutter/material.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/edit_tuto.dart';

class TutoriasList extends StatelessWidget {
  final Map<String, dynamic> tutoria;
  final List<String> number = [
    "Primero",
    "Segundo",
    "Tercero",
    "Cuarto",
    "Quinto",
    "Sexto"
  ];
  TutoriasList({Key? key, required this.tutoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TutoappBloc, TutoappState>(
      listener: (context, state) {
        if (state is TutoappEditTutoState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditTuto()));
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<TutoappBloc>(context).add(
                                          TutoappEditTutoEvent(
                                              documento: tutoria));
                                    },
                                    icon: Icon(Icons.edit)),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    tutoria['tutoria']['materia'] +
                                        " " +
                                        (number.indexOf(tutoria['tutoria']
                                                    ['grado']) +
                                                1)
                                            .toString(),
                                    style: TextStyle(
                                        fontFamily: 'Chewy-Regular',
                                        fontSize: 20,
                                        color: Colors.amber[600]!),
                                  ),
                                ),
                              ],
                            ),
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
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        child: IconButton(
                          onPressed: (() {}),
                          icon: Image.asset('assets/images/zoom.png'),
                        ),
                        visible: (tutoria['zoom'] != 'null'),
                      ),
                      Visibility(
                        child: IconButton(
                          onPressed: (() {}),
                          icon: Icon(Icons.circle),
                          color: Color.fromARGB(0, 255, 255, 255),
                        ),
                        visible: (tutoria['zoom'] == 'null'),
                      ),
                      Column(
                        children: [
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
                              onPressed: () {
                                _cancelQuestion(context);
                              },
                              child: Text("Cancelar"),
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
                  Navigator.of(context).pop();
                  BlocProvider.of<TutoappBloc>(context).add(
                      TutoappCancelarEvent(documento: tutoria['documento']));
                },
                child: Text('ACCEPT',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
              ),
            ],
          );
        });
  }
}
