import 'package:flutter/material.dart';

class WidgetReusable extends StatelessWidget {
  const WidgetReusable({@required this.colour, this.widgetHijo});
  final Color colour;
  final Widget widgetHijo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widgetHijo,
      margin: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(17.0),
      ),
    );
  }
}
