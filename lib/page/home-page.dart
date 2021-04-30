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
        title: Text("Calculadora"),
      ),
      body: _body(),
    );
  }

  //Hola enanita.
  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: listaResultados,
                    ),
                  ],
                ),
              )),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            children: [
              Text(operaciones),
            ],
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "7";
                        });
                      },
                      child: Text("7")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "8";
                        });
                      },
                      child: Text("8")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "9";
                        });
                      },
                      child: Text("9")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " / ";
                        });
                      },
                      child: Text("/")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " √ ";
                          _calcularOperacion();
                          operaciones = "";
                        });
                      },
                      child: Text("²√"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "4";
                        });
                      },
                      child: Text("4")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "5";
                        });
                      },
                      child: Text("5")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "6";
                        });
                      },
                      child: Text("6")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " x ";
                        });
                      },
                      child: Text("x")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " % ";
                          _calcularOperacion();
                          operaciones = "";
                        });
                      },
                      child: Text("%"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "1";
                        });
                      },
                      child: Text("1")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "2";
                        });
                      },
                      child: Text("2")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "3";
                        });
                      },
                      child: Text("3")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " - ";
                        });
                      },
                      child: Text("-")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " ^ ";
                          _calcularOperacion();
                          operaciones = "";
                        });
                      },
                      child: Text("x²"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "0";
                        });
                      },
                      child: Text("0")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones = "";
                        });
                      },
                      child: Text("CE")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones = "";
                          setState(() {
                            listaResultados.clear();
                          });
                        });
                      },
                      child: Text("C")),
                  ElevatedButton(
                      onPressed: () {
                        _calcularOperacion();
                        operaciones = "";
                      },
                      child: Text("=")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " + ";
                        });
                      },
                      child: Text("+"))
                ],
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
