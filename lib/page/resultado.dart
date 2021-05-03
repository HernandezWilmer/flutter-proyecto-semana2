import 'package:calculadora_imc/page/constantes.dart';
import 'package:calculadora_imc/page/widget-reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaResultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your result',
                style: kEstiloDeEtiqueta,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: WidgetReusable(
              colour: kColorActivo,
              widgetHijo: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text('SOBREPESO', style: kEstiloDeEtiqueta),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '28.4',
                      style: kEstiloDeEtiqueta,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'You have more weight than normal body weight. Try exercising more.',
                      textAlign: TextAlign.center,
                      style: kEstiloDeEtiqueta,
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*BottomButton(
            buttonText: 'RE - CALCULATE',
            route: '/',
          ),*/
        ],
      ),
    );
  }
}
