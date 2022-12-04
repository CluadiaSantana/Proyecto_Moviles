import 'package:flutter/material.dart';
import 'package:proyecto/Repository/tutorias_repository.dart';
import 'package:proyecto/pages/tutorias/agenda.dart';
import 'package:proyecto/pages/tutorias/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/tutorias/disponibles_list.dart';

class TutoriasDisponibles extends StatefulWidget {
  const TutoriasDisponibles({super.key});

  @override
  State<TutoriasDisponibles> createState() => _TutoriasDisponiblesState();
}

class _TutoriasDisponiblesState extends State<TutoriasDisponibles> {
  List<String> _horario = [
    '0900',
    '1100',
    '1300',
    '1500',
    '1700',
    '1900',
    '2100'
  ];
  List<String> _dates = Tutorias().list_search();
  String _hourI = "";
  String _hourF = "";
  String _dateI = "";
  String _dateF = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tutorias Disponibles',
              style: TextStyle(fontFamily: 'Chewy-Regular')),
          actions: [
            IconButton(
                onPressed: (() {
                  _filter(context);
                }),
                icon: Icon(Icons.filter_list))
          ],
        ),
        body: Center(child: _listTutorias()));
  }

  BlocConsumer<TutoappBloc, TutoappState> _listTutorias() {
    return BlocConsumer<TutoappBloc, TutoappState>(listener: (context, state) {
      if (state is TutoappHomeState) {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      }
      if (state is TutoappSeeAgendState) {
        print("hola");
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Agenda()));
      }
      if (state is TutoappErrorHoraState) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Ya se tiene una tutoria agendada en ese horario'),
        ));
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
      return Center(child: CircularProgressIndicator());
    });
  }

  Future<void> _filter(context) {
    return showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                insetPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: Text('Filtar Tutorias',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.amber[600],
                        fontWeight: FontWeight.bold)),
                content: Container(
                    padding: const EdgeInsets.all(5),
                    width: 50,
                    height: 300,
                    child: Column(children: [
                      _titulo('Del'),
                      _choice(setState, _dates, "di"),
                      _titulo('Al'),
                      _choice(setState, _dates, "df"),
                      _titulo('De'),
                      _choiceH(setState, _horario, "hi"),
                      _titulo('A'),
                      _choiceH(setState, _horario, "hf"),
                    ])),
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
                          TutoappFiltrarEvent(
                              hourI: _hourI.toString(),
                              hourF: _hourF.toString(),
                              dateI: _dateI.toString(),
                              dateF: _dateF.toString()));
                    },
                    child: Text('ACCEPT',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                ],
              );
            }));
  }

  DropdownButton<String> _choice(
      StateSetter setState, List<String> option, String val) {
    return DropdownButton(
      items: option.map((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          ;
          _dateI = val == "di" ? value! : _dateI;
          _dateF = val == "df" ? value! : _dateF;
        });
      },
      hint: Text(
        val == "di" ? _dateI : _dateF,
        style: TextStyle(
            fontFamily: 'Chewy-Regular',
            color: Colors.amber[600],
            fontSize: 20),
      ),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(fontFamily: 'Chewy-Regular', color: Colors.amber[600]),
    );
  }

  DropdownButton<String> _choiceH(
      StateSetter setState, List<String> option, String val) {
    return DropdownButton(
      items: option.map((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          ;
          _hourI = val == "hi" ? value! : _hourI;
          _hourF = val == "hf" ? value! : _hourF;
        });
      },
      hint: Text(
        val == "hi" ? _hourI : _hourF,
        style: TextStyle(
            fontFamily: 'Chewy-Regular',
            color: Colors.amber[600],
            fontSize: 20),
      ),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(fontFamily: 'Chewy-Regular', color: Colors.amber[600]),
    );
  }

  Text _titulo(String txt) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: 18, color: Colors.green[600], fontWeight: FontWeight.bold),
    );
  }
}
