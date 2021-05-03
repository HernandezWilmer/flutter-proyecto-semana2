import 'package:calculadora_imc/componentes/tarjeta_reusable.dart';
import 'package:calculadora_imc/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../componentes/boton.dart';

class PaginaResultados extends StatelessWidget {
  static const routeName = '/result';
  PaginaResultados({this.imcCalculado, this.textoResultado, this.consejo});

  final String imcCalculado;
  final String textoResultado;
  final String consejo;
  @override
  Widget build(BuildContext context) {
    final PaginaResultados paginaResultado =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
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
                'Resultado',
                style: cEstiloTitulos,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: TarjetaReusable(
              colorTarjeta: cColorDeTarjetaActiva,
              tarjetaHijo: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        paginaResultado.textoResultado,
                        style: cEstiloDelTextoResultado,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      paginaResultado.imcCalculado,
                      style: cEstiloTextoIMC,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      paginaResultado.consejo,
                      textAlign: TextAlign.center,
                      style: cEstiloTextoBody,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Boton(
            textoDelBoton: 'Calcular',
            presionado: () {
              Navigator.pushNamed(
                context,
                '/',
              );
            },
          ),
        ],
      ),
    );
  }
}
