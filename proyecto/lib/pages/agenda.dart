import 'package:flutter/material.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/tutorias_list.dart';

class Agenda extends StatelessWidget {
  const Agenda({super.key});

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
        ),
        body: Center(child: _listTutorias()));
  }

  BlocConsumer<TutoappBloc, TutoappState> _listTutorias() {
    return BlocConsumer<TutoappBloc, TutoappState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TutoappSeeAgendState) {
            return ListView.builder(
              itemCount: state.tuto_list.length,
              itemBuilder: (BuildContext context, int index) {
                return TutoriasList(tutoria: state.tuto_list[index]);
              },
            );
          }
          return Text("No hay tutorias agregadas");
        });
  }
}
