import 'package:flutter/material.dart';
import 'package:proyecto/pages/agenda.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
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
      body: SingleChildScrollView(
        child: BlocConsumer<TutoappBloc, TutoappState>(
          listener: (context, state) {
            if (state is TutoappCompleteAgendState) {
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
                  _horario(),
                  _description(),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TutoappBloc>(context).add(
                          TutoappCompleteAgendEvent(horario: '0900 - 1100'));
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
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Escribe una breve descripcion de tus dudas'),
        ),
      ]),
    );
  }

  Container _horario() {
    return Container(
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
                    separatorBuilder: (BuildContext context, int index) =>
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
        ],
      ),
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
