import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:proyecto/pages/homepage.dart';
import 'package:proyecto/pages/tutorias_disponibles.dart';

class FormBody extends StatelessWidget {
  final ValueChanged<bool> onAnonymousLoginTap;
  final ValueChanged<bool> onGoogleLoginTap;

  FormBody({
    Key? key,
    required this.onAnonymousLoginTap,
    required this.onGoogleLoginTap,
  }) : super(key: key);
  var _correo = TextEditingController();
  var _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TutoappBloc, TutoappState>(
      listener: (context, state) {
        if (state is TutoappLoginFailStete) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Datos incorrectos')));
        }

        if (state is TutoappStudentStete) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        }

        if (state is TutoappTutorStete) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TutoriasDisponibles()));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 256,
              width: 256,
              child: Image.asset('assets/images/Logo.jpg'),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "BIENVENIDO",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Chewy-Regular',
                  color: Colors.green[400],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      BlocProvider.of<TutoappBloc>(context).add(
                          TutoAppSingInEvent(
                              correo: _correo.value.text,
                              password: _password.value.text));
                    },
                    color: Color.fromARGB(255, 250, 250, 250),
                    child: Row(
                      children: [
                        SizedBox(width: 14),
                        Text(
                          "SignUp",
                          style: TextStyle(
                              fontFamily: 'Chewy-Regular',
                              color: Colors.amber[600],
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            TextField(
              controller: _correo,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Correo'),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Contraseña'),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: Color.fromARGB(255, 250, 250, 250),
                    child: Row(
                      children: [
                        SizedBox(width: 14),
                        Text(
                          "Entar",
                          style: TextStyle(
                              fontFamily: 'Chewy-Regular',
                              color: Colors.lightBlue[600],
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Expanded(
                    child: GoogleAuthButton(
                      onPressed: () => onGoogleLoginTap(true),
                      text: "Iniciar con Google",
                      style: AuthButtonStyle(borderRadius: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Al acceder se aceptan los terminos y condiciones asi como la politica de privacidad, ",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 10),
              ),
            ),
            SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
