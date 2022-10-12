import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/agenda.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';

void main() =>
    runApp(BlocProvider(create: (context) => TutoappBloc(), child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Agenda(),
    );
  }
}
