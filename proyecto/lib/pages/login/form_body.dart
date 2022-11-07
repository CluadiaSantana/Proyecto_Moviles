import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormBody extends StatelessWidget {
  // cambiar a un solo value changed que reciba enum de login
  final ValueChanged<bool> onAnonymousLoginTap;
  final ValueChanged<bool> onGoogleLoginTap;

  FormBody({
    Key? key,
    required this.onAnonymousLoginTap,
    required this.onGoogleLoginTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: utilizar un logo en vez de un container azul
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
                onPressed: () => onAnonymousLoginTap(true),
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
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Correo'),
        ),
        SizedBox(height: 24),
        TextField(
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
                onPressed: () => onAnonymousLoginTap(true),
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
          // TODO:  sustituir este texto con uno real
          child: Text(
            "Al acceder se aceptan los terminos y condiciones asi como la politica de privacidad, "
            "mismos que pueden ser consultados en mipaginaweb.iteso.com.mx o en los ajustes de la aplicacion.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 10),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
