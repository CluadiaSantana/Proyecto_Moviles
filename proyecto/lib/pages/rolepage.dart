import 'package:flutter/material.dart';
import 'package:proyecto/pages/alumno_tutorias/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/login/bloc/auth_bloc.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  String? currentRadio;
  bool isSwitched = false;
  double tipAmount = 0;
  var radioGroup = {0: "Tutor", 1: "Alumno"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<TutoappBloc, TutoappState>(
        listener: (context, state) {
          if (state is TutoappHomeState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Text(
                  "Escoge si eres....",
                  style: TextStyle(
                      fontFamily: 'Chewy-Regular',
                      fontSize: 40,
                      color: Colors.amber[600]),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 45),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: radioGroupGenerator(),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: (() {
                    BlocProvider.of<TutoappBloc>(context)
                        .add(TutoappRoleEvent(role: currentRadio!));
                  }),
                  child: Text("Aceptar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600]),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  radioGroupGenerator() {
    return radioGroup.entries
        .map(
          (radioElement) => ListTile(
              visualDensity: VisualDensity(vertical: -3, horizontal: -4),
              leading: Radio(
                value: radioElement.value,
                groupValue: currentRadio,
                onChanged: (String? selected) {
                  currentRadio = selected;
                  setState(() {});
                },
              ),
              title: Text(
                "${radioElement.value}",
                style: TextStyle(
                  fontFamily: 'Chewy-Regular',
                  fontSize: 24,
                  color: Colors.green[600],
                ),
              )),
        )
        .toList();
  }
}
