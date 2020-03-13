import 'package:flutter/material.dart';
import 'package:mba_app/views/home.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botão de emergência',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(title: 'Botão de emergência'),
    );
  }
}
