import 'package:flutter/material.dart';

import '../constantes.dart';

class Iconos extends StatelessWidget {
  const Iconos({@required this.icono, @required this.etiqueta});

  final IconData icono;
  final String etiqueta;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icono,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$etiqueta',
          style: cEstiloDeEtiqueta,
        )
      ],
    );
  }
}
