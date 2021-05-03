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
                    etiqueta: "Masculino",
                  ),
                  colour: _getColorM(generoSeleccionado),
                ),
              ),
              Expanded(
                child: new WidgetReusable(
                  widgetHijo: IconosContenido(
                    icono: FontAwesomeIcons.venus,
                    etiqueta: "Femenino",
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
            colour: Colors.red, //kColorActivo
            widgetHijo: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Altura',
                  style: kEstiloDeEtiqueta,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      //estatura.toString(),
                      '1.80',
                      style: kNumeroEstioDeTexto,
                    ),
                    Text(
                      'cm',
                      style: kEstiloDeEtiqueta,
                    ),
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(),
                    child: Slider(
                      //value: altura.toDouble(),
                      value: 180.0,
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
//                          altura = newValue.round();
                        });
                      },
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: new WidgetReusable(
                  colour: Colors.yellow,
                  widgetHijo: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PESO',
                        style: kEstiloDeEtiqueta,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                //if (peso > 30) peso--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  //weight++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: new WidgetReusable(
                  colour: Colors.blue,
                  widgetHijo: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        //style: kLabelStyle,
                      ),
                      Text(
                        '',
                        //age.toString(),
                        style: kNumeroEstioDeTexto,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  //if (age > 1) age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                //age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
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
