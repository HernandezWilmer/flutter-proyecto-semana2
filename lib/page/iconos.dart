import 'package:flutter/material.dart';

import 'constantes.dart';

class IconosContenido extends StatelessWidget {
  const IconosContenido({@required this.icono, @required this.etiqueta});

  final IconData icono;
  final String etiqueta;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icono,
          size: kAlturaContenedor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$etiqueta',
          style: kEstiloDeEtiqueta,
        )
      ],
    );
  }
}
