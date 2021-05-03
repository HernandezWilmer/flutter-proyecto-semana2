import 'package:calculadora_imc/calcula_imc.dart';
import 'package:calculadora_imc/componentes/boton_redondeado.dart';
import 'package:calculadora_imc/pages/pagina_de_resultados.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../componentes/boton.dart';
import '../componentes/iconos.dart';
import '../componentes/tarjeta_reusable.dart';
import '../constantes.dart';

enum Genero { Masculino, Femenino }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Genero generoSeleccionado;

  int _edad = 39;
  int _estatura = 180;
  int _peso = 85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: new TarjetaReusable(
                    seleccionado: () {
                      setState(() {
                        generoSeleccionado = Genero.Masculino;
                      });
                    },
                    tarjetaHijo: Iconos(
                      icono: FontAwesomeIcons.mars,
                      etiqueta: 'Masculino',
                    ),
                    colorTarjeta: _getColorFemenino(generoSeleccionado),
                  ),
                ),
                Expanded(
                  child: new TarjetaReusable(
                    tarjetaHijo: Iconos(
                      icono: FontAwesomeIcons.venus,
                      etiqueta: 'Femenino',
                    ),
                    seleccionado: () {
                      setState(() {
                        generoSeleccionado = Genero.Femenino;
                      });
                    },
                    colorTarjeta: _getColorMasculino(generoSeleccionado),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: new TarjetaReusable(
              colorTarjeta: cColorDeTarjetaActiva,
              tarjetaHijo: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Estatura',
                    style: cEstiloDeEtiqueta,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _estatura.toString(),
                        style: cEstiloTextoNumero,
                      ),
                      Text(
                        'cm',
                        style: cEstiloDeEtiqueta,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 30.0),
                    ),
                    child: Slider(
                      value: _estatura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double valor) {
                        setState(() {
                          _estatura = valor.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: new TarjetaReusable(
                    colorTarjeta: cColorDeTarjetaActiva,
                    tarjetaHijo: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Peso',
                          style: cEstiloDeEtiqueta,
                        ),
                        Text(
                          _peso.toString(),
                          style: cEstiloTextoNumero,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotonIconoRedondeado(
                              icono: FontAwesomeIcons.minus,
                              seleccionado: () {
                                setState(() {
                                  if (_peso > 30) {
                                    _peso--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotonIconoRedondeado(
                              icono: FontAwesomeIcons.plus,
                              seleccionado: () {
                                setState(() {
                                  _peso++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new TarjetaReusable(
                    colorTarjeta: cColorDeTarjetaActiva,
                    tarjetaHijo: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Edad',
                          style: cEstiloDeEtiqueta,
                        ),
                        Text(
                          _edad.toString(),
                          style: cEstiloTextoNumero,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotonIconoRedondeado(
                              icono: FontAwesomeIcons.minus,
                              seleccionado: () {
                                setState(() {
                                  if (_edad > 1) {
                                    _edad--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            BotonIconoRedondeado(
                              icono: FontAwesomeIcons.plus,
                              seleccionado: () {
                                setState(() {
                                  _edad++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Boton(
            textoDelBoton: 'Calcular',
            presionado: () {
              CalculaElIMC calc =
                  CalculaElIMC(estatura: _estatura, peso: _peso);
              Navigator.pushNamed(
                context,
                PaginaResultados.routeName,
                arguments: PaginaResultados(
                  imcCalculado: calc.calculateBMI(),
                  textoResultado: calc.getResultado(),
                  consejo: calc.getConsejo(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Color _getColorFemenino(generoSeleccionado) {
    if (generoSeleccionado == Genero.Femenino) {
      return cColorDeTarjetaActiva;
    } else {
      return cColorDeTarjetaInactiva;
    }
  }

  Color _getColorMasculino(generoSeleccionado) {
    if (generoSeleccionado == Genero.Masculino) {
      return cColorDeTarjetaActiva;
    } else {
      return cColorDeTarjetaInactiva;
    }
  }
}
