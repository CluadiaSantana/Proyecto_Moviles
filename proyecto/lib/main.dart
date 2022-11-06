import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/agenda.dart';
import 'package:proyecto/pages/agendar_tutoria.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/login/login_form.dart';
import 'package:proyecto/pages/login/login_page.dart';
import 'package:proyecto/pages/registro.dart';
import 'package:proyecto/pages/tutorias_disponibles.dart';

void main() =>
    runApp(BlocProvider(create: (context) => TutoappBloc(), child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutoapp',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.green)),
      home: Registro(),
    );
  }
}
