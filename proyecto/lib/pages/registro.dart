import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

enum UserType { estudiante, tutor }

class _RegistroState extends State<Registro> {
  UserType? _userType = UserType.estudiante;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "TutoApp - Registro",
            style: TextStyle(
                fontFamily: 'Chewy-Regular',
                fontSize: 24,
                color: Colors.amber[600]),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 40,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                inputTitle("Nombre"),
                inputField("Nombre"),
                inputTitle("Apellido"),
                inputField("Apellido"),
                inputTitle("Correo"),
                inputField("Correo Electronico"),
                inputTitle("Password"),
                inputField("Password"),
                inputTitle("Tutor o Estudiante?"),
                radioButtons("Tutor", UserType.tutor),
                radioButtons("Estudiante", UserType.estudiante),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 60, 8, 0),
                  child: ElevatedButton(
                    child: const Text('Registrarse'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  SizedBox radioButtons(String title, UserType u) {
    return SizedBox(
      child: RadioListTile<UserType>(
        title: Text(
          "${title}",
          style: TextStyle(
              fontFamily: 'Chewy-Regular',
              fontSize: 18,
              color: Colors.amber[600]),
        ),
        value: u,
        groupValue: _userType,
        onChanged: (UserType? value) {
          setState(() {
            _userType = value;
          });
        },
      ),
    );
  }

  Padding inputField(String input) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '${input}',
        ),
      ),
    );
  }

  Padding inputTitle(String input) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Text(
            "${input}",
            style: TextStyle(
                fontFamily: 'Chewy-Regular',
                fontSize: 24,
                color: Colors.amber[600]),
          ),
        ],
      ),
    );
  }
}
