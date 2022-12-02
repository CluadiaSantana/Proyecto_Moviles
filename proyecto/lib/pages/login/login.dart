import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/login/bloc/auth_bloc.dart';
import 'package:proyecto/pages/rolepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthMidWayState) {
            Scaffold.of(context)
                .showBottomSheet((context) => _fingerprintOption(context));
          } else if (state is AuthFingerprintWaitingState) {
          } else if (state is AuthSuccessState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
            ;
          } else if (state is AuthRoleState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RolePage()));
          }
        },
        builder: (context, state) {
          if (state is UnAuthState ||
              state is AuthErrorState ||
              state is SignOutSuccessState ||
              state is AuthMidWayState) {
            return Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 250,
                    child: Image.asset(
                      'assets/images/Logo.jpg',
                      scale: 1.5,
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 200,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GoogleAuthButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(GoogleAuthEvent());
                        },
                        text: "Iniciar con Google",
                        style: AuthButtonStyle(
                            buttonColor: Color.fromARGB(255, 5, 134, 9),
                            iconColor: Colors.white,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            width: 350),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  SizedBox _fingerprintOption(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Entrar con huella',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Chewy-Regular', color: Colors.blue),
          ),
          Icon(
            Icons.fingerprint,
            size: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(FingerEvent());
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                  BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
