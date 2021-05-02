import 'package:calculadora_imc/page/iconos.dart';
import 'package:calculadora_imc/page/widget-reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constantes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum Genero { Masculino, Femenino }

class _HomePageState extends State<HomePage> {
  Genero generoSeleccionado;

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
                  presionado: () {
                    setState(() {
                      generoSeleccionado = Genero.Masculino;
                    });
                  },
                  widgetHijo: IconosContenido(
                    icono: FontAwesomeIcons.mars,
                    etiqueta: "MASCULINO",
                  ),
                  colour: _getColorM(generoSeleccionado),
                ),
              ),
              Expanded(
                child: new WidgetReusable(
                  widgetHijo: IconosContenido(
                    icono: FontAwesomeIcons.venus,
                    etiqueta: "FEMENINO",
                  ),
                  presionado: () {
                    setState(() {
                      generoSeleccionado = Genero.Femenino;
                    });
                  },
                  colour: _getColorF(generoSeleccionado),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: new WidgetReusable(
            colour: kColorActivo,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: new WidgetReusable(
                  colour: kColorActivo,
                ),
              ),
              Expanded(
                child: new WidgetReusable(
                  colour: kColorActivo,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } // Cierre del _body
} // Cierre de la clase

Color _getColorM(generoSeleccionado) {
  if (generoSeleccionado == Genero.Masculino) {
    return kColorActivo;
  } else {
    return kColorInactivo;
  }
}

Color _getColorF(generoSeleccionado) {
  if (generoSeleccionado == Genero.Femenino) {
    return kColorActivo;
  } else {
    return kColorInactivo;
  }
}
