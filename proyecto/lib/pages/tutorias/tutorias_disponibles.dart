import 'package:flutter/material.dart';
import 'package:proyecto/pages/tutorias/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/tutorias/disponibles_list.dart';

class TutoriasDisponibles extends StatelessWidget {
  const TutoriasDisponibles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TutAapp', style: TextStyle(fontFamily: 'Chewy-Regular')),
        ),
        body: Center(child: Container(child: _listTutorias())));
  }

  BlocConsumer<TutoappBloc, TutoappState> _listTutorias() {
    return BlocConsumer<TutoappBloc, TutoappState>(listener: (context, state) {
      if (state is TutoappHomeState) {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }
    }, builder: (context, state) {
      if (state is TutoappSelectTutoState) {
        if (state.data_list.length > 0) {
          return ListView.builder(
            itemCount: state.data_list.length,
            itemBuilder: (BuildContext context, int index) {
              return DisponiblesList(tutoria: state.data_list[index]);
            },
          );
        } else {
          return Text("No hay tutorias diponibles");
        }
      }
      return Text("");
    });
  }
}
