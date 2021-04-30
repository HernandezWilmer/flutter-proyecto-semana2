import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

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

  //Hola enanita.
  Widget _body() {
    return Column(
      children: [
        Container(
          color: Colors.yellow,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _calcularOperacion() {
    var arreglo = operaciones.split(" ");
    double resultado = 0;
    double primerTermino = 0;
    double segundoTermino = 0;
    String operador = arreglo[1].trim();

    if (arreglo[1].trim() != "" && operador != "" && arreglo[2].trim() == "") {
      primerTermino = double.parse(arreglo[0].trim());
      if (arreglo[1].trim() != "" && operador == "√") {
        resultado = sqrt(primerTermino);
        operador = "²√";
        setState(() {
          listaResultados.add(Text("$operador $primerTermino = $resultado\n"));
        });
      } else if (arreglo[1].trim() != "" && operador == "^") {
        resultado = pow(primerTermino, 2);
        operador = "²";
        setState(() {
          listaResultados.add(Text("$primerTermino $operador = $resultado\n"));
        });
      } else if (arreglo[1].trim() != "" && operador == "%") {
        resultado = primerTermino / 100;
        setState(() {
          listaResultados.add(Text("$primerTermino $operador = $resultado\n"));
        });
      }
    } else if (arreglo[1].trim() != "" &&
        operador != "" &&
        arreglo[2].trim() != "") {
      primerTermino = double.parse(arreglo[0].trim());
      segundoTermino = double.parse(arreglo[2].trim());
      if (operador == "-") {
        resultado = primerTermino - segundoTermino;
      } else if (operador == "+") {
        resultado = primerTermino + segundoTermino;
      } else if (operador == "/" && segundoTermino > 0) {
        resultado = primerTermino / segundoTermino;
      } else if (operador == "x") {
        resultado = primerTermino * segundoTermino;
      } else if (operador == "√") {
        resultado = sqrt(primerTermino);
      }
      setState(() {
        listaResultados.add(
            Text("$primerTermino $operador $segundoTermino = $resultado\n"));
      });
    }
  }
}
