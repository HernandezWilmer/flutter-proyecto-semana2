import 'package:calculadora_imc/pages/pagina_de_resultados.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(CalculadoraDeIMC());
}

class CalculadoraDeIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: {
        PaginaResultados.routeName: (context) => PaginaResultados(),
      },
    );
  }
}
