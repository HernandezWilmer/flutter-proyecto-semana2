import 'package:calculadora_imc/page/home-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora IMC",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
