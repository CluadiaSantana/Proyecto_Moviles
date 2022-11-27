import 'package:flutter/material.dart';
import 'package:proyecto/pages/agendar_tutoria.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/login/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

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
                  onPressed: () {},
                  child: Text("Home",
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.blueGrey[300],
                          fontSize: 20))),
              TextButton(
                  onPressed: () {},
                  child: Text("Agenda",
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.blueGrey[300],
                          fontSize: 20))),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: BlocConsumer<TutoappBloc, TutoappState>(
            listener: (context, state) {
              if (state is TutoappListState) {
                Scaffold.of(context).showBottomSheet((context) => SizedBox(
                    height: 170, width: 500, child: _showBottonList(state)));
              } else if (state is TutoappAgendaChoiceState) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AgendarTutoria()));
              }
            },
            builder: (context, state) {
              return GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return _bottonGrade(context, index);
                  });
            },
          ),
        ),
      ),
    );
  }

  Container _bottonGrade(BuildContext context, int index) {
    return Container(
      child: IconButton(
          onPressed: () {
            BlocProvider.of<TutoappBloc>(context)
                .add(TutoappSelectGradeEvent(grade: index + 1));
          },
          icon: Image.asset('assets/images/${index + 1}.gif')),
    );
  }

  ListView _showBottonList(TutoappListState state) {
    return ListView.separated(
      itemCount: state.subject.length,
      itemBuilder: (BuildContext context, int index) {
        return TextButton(
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
            ),
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<TutoappBloc>(context).add(
                  TutoappSelectSubjectEvent(
                      grade: state.grade, subject: state.subject[index]));
            },
            child: Text(
              state.subject[index],
              style: TextStyle(color: Colors.blueGrey[300], fontSize: 20),
            ));
      },
      separatorBuilder: (context, index) => Divider(
        thickness: 2,
        color: Colors.pink[100],
      ),
    );
  }
}
