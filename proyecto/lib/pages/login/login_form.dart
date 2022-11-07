import 'package:flutter/material.dart';
import 'form_body.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void _signUp(bool _) {
    print("Registarte");
  }

  void _googleLogIn(bool _) {
    // invocar al login de firebase con el bloc
    // recodar configurar pantallad Oauth en google Cloud
    print("google");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: FormBody(
                  onGoogleLoginTap: _googleLogIn,
                  onAnonymousLoginTap: _signUp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
