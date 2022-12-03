import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/alumno_tutorias/bloc/tutoapp_bloc.dart';
import 'package:proyecto/pages/login/bloc/auth_bloc.dart';
import 'package:proyecto/pages/login/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthBloc()..add(VerifyAuthEvent()),
    ),
    BlocProvider(create: (context) => TutoappBloc()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Login(),
    );
  }
}
