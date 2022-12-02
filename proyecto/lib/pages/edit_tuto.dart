import 'package:flutter/material.dart';
import 'package:proyecto/pages/agenda.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgendarTutoria extends StatefulWidget {
  const AgendarTutoria({super.key});

  @override
  State<AgendarTutoria> createState() => _AgendarTutoriaState();
}

class _AgendarTutoriaState extends State<AgendarTutoria> {
  var _help = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TutoApp - Edita Tu Tutoria",
          style: TextStyle(
              fontFamily: 'Chewy-Regular',
              fontSize: 24,
              color: Colors.amber[600]),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<TutoappBloc, TutoappState>(
          listener: (context, state) {
            if (state is TutoappSeeAgendState) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Agenda()));
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is TutoappAgendaChoiceState) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _data("Grado", state.grade),
                        _data("Materia", state.subject),
                      ],
                    ),
                  ),
                  _description(),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TutoappBloc>(context).add(
                          TutoappCompleteAgendEvent(
                              description: _help.value.text));
                    },
                    child: Text("Agendar Tutoria"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Container _description() {
    return Container(
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
          controller: _help,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Escribe una breve descripcion de tus dudas'),
        ),
      ]),
    );
  }

  Container _data(String title, dynamic data) {
    return Container(
        child: Column(children: [
      Text(
        title,
        style: TextStyle(
            fontFamily: 'Chewy-Regular', fontSize: 32, color: Colors.blue[600]),
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
            Text(
              data,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Chewy-Regular',
                  fontSize: 24,
                  color: Colors.amber[600]),
            ),
          ],
        ),
      ),
    ]));
  }
}
