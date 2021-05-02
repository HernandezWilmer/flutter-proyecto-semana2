import 'package:flutter/material.dart';

class WidgetReusable extends StatelessWidget {
  const WidgetReusable(
      {@required this.colour, this.widgetHijo, this.presionado});
  final Color colour;
  final Widget widgetHijo;
  final Function presionado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presionado,
      child: Container(
        child: widgetHijo,
        margin: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
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
