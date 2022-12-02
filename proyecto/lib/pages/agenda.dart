import 'package:flutter/material.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/tutorias_list.dart';
import 'package:proyecto/pages/login/bloc/auth_bloc.dart';

class Agenda extends StatelessWidget {
  const Agenda({super.key});

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
        body: Center(child: _listTutorias()));
  }

  BlocConsumer<TutoappBloc, TutoappState> _listTutorias() {
    return BlocConsumer<TutoappBloc, TutoappState>(listener: (context, state) {
      if (state is TutoappHomeState) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }
    }, builder: (context, state) {
      if (state is TutoappSeeAgendState) {
        if (state.tuto_list.length > 0) {
          return ListView.builder(
            itemCount: state.tuto_list.length,
            itemBuilder: (BuildContext context, int index) {
              return TutoriasList(tutoria: state.tuto_list[index]);
            },
          );
        } else {
          return Text("No hay tutorias agregadas");
        }
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
