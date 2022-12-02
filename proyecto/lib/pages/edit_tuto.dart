import 'package:flutter/material.dart';
import 'package:proyecto/pages/login/bloc/auth_bloc.dart';
import 'package:proyecto/pages/agenda.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTuto extends StatefulWidget {
  const EditTuto({super.key});

  @override
  State<EditTuto> createState() => _EditTutoState();
}

class _EditTutoState extends State<EditTuto> {
  var _help = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TutAapp', style: TextStyle(fontFamily: 'Chewy-Regular')),
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<TutoappBloc>(context)
                        .add(TutoappHomeEvent());
                  },
                  child: Text("Home",
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.blueGrey[300],
                          fontSize: 20))),
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    BlocProvider.of<TutoappBloc>(context)
                        .add(TutoappGoAgendaEvent());
                  },
                  child: Text("Agenda",
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.blueGrey[300],
                          fontSize: 20))),
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Log Out",
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.red,
                          fontSize: 20))),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<TutoappBloc, TutoappState>(
          listener: (context, state) {
            if (state is TutoappSeeAgendState) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Agenda()));
            }
          },
          builder: (context, state) {
            if (state is TutoappEditTutoState) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _data("Grado", state.documento['tutoria']['grado']),
                        _data("Materia", state.documento['tutoria']['materia']),
                        _data("Fecha", state.documento['tutoria']['fecha']),
                        _data(
                            "Horario",
                            state.documento['tutoria']['horaInicio'] +
                                '-' +
                                state.documento['tutoria']['horaFin']),
                      ],
                    ),
                  ),
                  _description(state.documento['tutoria']['ayuda']),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Editar Tutoria"),
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

  Container _description(String description) {
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
              border: OutlineInputBorder(), hintText: description),
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
