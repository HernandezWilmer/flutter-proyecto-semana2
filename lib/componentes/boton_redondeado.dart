import 'package:flutter/material.dart';

class BotonIconoRedondeado extends StatelessWidget {
  BotonIconoRedondeado({@required this.icono, @required this.seleccionado});
  final IconData icono;
  final Function seleccionado;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icono),
      onPressed: () {
        seleccionado();
      },
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
    );
  }
}
