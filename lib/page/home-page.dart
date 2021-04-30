import 'package:calculadora_imc/page/iconos.dart';
import 'package:calculadora_imc/page/widget-reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum Gender { Masculino, Femenino }
const colorPorDefecto = Color(0xFF1D1E20);
const inActiveCardColor = Color(0xFF111320);

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
                child: new WidgetReusable(
                  widgetHijo: IconosContenido(
                    icono: FontAwesomeIcons.mars,
                    etiqueta: "MASCULINO",
                  ),
                  colour: colorPorDefecto,
                ),
              ),
              Expanded(
                child: new WidgetReusable(
                  widgetHijo: IconosContenido(
                    icono: FontAwesomeIcons.venus,
                    etiqueta: "FEMENINO",
                  ),
                  colour: colorPorDefecto,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: new WidgetReusable(
            colour: colorPorDefecto,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: new WidgetReusable(
                  colour: colorPorDefecto,
                ),
              ),
              Expanded(
                child: new WidgetReusable(
                  colour: colorPorDefecto,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } // Cierre del _body
} // Cierre de la clase