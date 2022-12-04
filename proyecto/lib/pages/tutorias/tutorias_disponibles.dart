import 'package:flutter/material.dart';
import 'package:proyecto/Repository/tutorias_repository.dart';
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

  Future<void> _filter(context) {
    final List<String> _horario = [
      '0900-1100',
      '1100-1300',
      '1300-1500',
      '1500-1700',
      '1700-1900',
      '1900-2100'
    ];
    final List<String> _dates = Tutorias().list_search();
    String _hourI = "0900";
    String _hourF = "2100";
    String _dateI = _dates[0];
    String _dateF = _dates[6];
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
                    Text(
                      'Del',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      items: _dates.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {});
                      },
                      hint: Text(
                        _dateI,
                        style: TextStyle(
                            fontFamily: 'Chewy-Regular',
                            color: Colors.amber[600],
                            fontSize: 20),
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.amber[600]),
                    ),
                    Text(
                      'Al',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      items: _dates.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {});
                      },
                      hint: Text(
                        _dateF,
                        style: TextStyle(
                            fontFamily: 'Chewy-Regular',
                            color: Colors.amber[600],
                            fontSize: 20),
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.amber[600]),
                    ),
                    Text(
                      'De',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      items: _horario.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {});
                      },
                      hint: Text(
                        _hourI,
                        style: TextStyle(
                            fontFamily: 'Chewy-Regular',
                            color: Colors.amber[600],
                            fontSize: 20),
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.amber[600]),
                    ),
                    Text(
                      'A',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      items: _horario.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {});
                      },
                      hint: Text(
                        _hourF,
                        style: TextStyle(
                            fontFamily: 'Chewy-Regular',
                            color: Colors.amber[600],
                            fontSize: 20),
                      ),
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: TextStyle(
                          fontFamily: 'Chewy-Regular',
                          color: Colors.amber[600]),
                    ),
                  ]),
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
                    onPressed: () {},
                    child: Text('ACCEPT',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                ],
              );
            }));
  }
}
