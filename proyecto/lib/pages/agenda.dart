import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Agenda extends StatelessWidget {
  const Agenda({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
