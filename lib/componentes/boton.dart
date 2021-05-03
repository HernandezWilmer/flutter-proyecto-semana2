import 'package:flutter/material.dart';

import '../constantes.dart';

class Boton extends StatelessWidget {
  const Boton({@required this.textoDelBoton, @required this.presionado});

  final String textoDelBoton;
  final Function presionado;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presionado,
      child: Container(
        child: Center(
          child: Text(
            textoDelBoton,
            style: cEstiloBotonGrande,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: cColorDelUltioContenedor,
        height: cAlturaDelUltimoContenedor,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}
