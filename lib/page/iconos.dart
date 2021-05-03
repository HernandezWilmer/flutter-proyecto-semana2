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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        onPressed();
      },
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
    );
  }
}
