import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:proyecto/pages/login/login_form.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(create: (context) => TutoappBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutoappa',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.green)),
      home: LoginForm(),
    );
  }
}
