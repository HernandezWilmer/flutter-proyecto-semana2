import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({@required this.colour});
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(17.0),
      ),
    );
  }
}
