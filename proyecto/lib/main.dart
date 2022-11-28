import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/login/bloc/auth_bloc.dart';
import 'package:proyecto/pages/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto/pages/rolepage.dart';

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
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: ((context, state) {
          if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Error al autenticase"),
              ),
            );
          }
        }),
        builder: (context, state) {
          if (state is AuthSuccessState) {
            return HomePage();
          } else if (state is UnAuthState ||
              state is AuthErrorState ||
              state is SignOutSuccessState ||
              state is AuthMidWayState) {
            return Login();
          } else if (state is AuthRoleState) {
            return RolePage();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
