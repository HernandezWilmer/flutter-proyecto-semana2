//import 'dart:math';
import 'package:calculadora_imc/page/widget-reusable.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const activeCardColor = Color(0xFF1D1E20);

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String resultadoOperaciones = "";
  List<Text> listaResultados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: new WidgetReusable(colour: activeCardColor),
              ),
              Expanded(
                child: new WidgetReusable(colour: activeCardColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
