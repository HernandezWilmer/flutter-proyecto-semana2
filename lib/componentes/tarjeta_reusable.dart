import 'package:flutter/material.dart';

class TarjetaReusable extends StatelessWidget {
  const TarjetaReusable(
      {@required this.colorTarjeta, this.tarjetaHijo, this.seleccionado});
  final Color colorTarjeta;
  final Widget tarjetaHijo;
  final Function seleccionado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: seleccionado,
      child: Container(
        child: tarjetaHijo,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colorTarjeta,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
