import 'dart:math';

class CalculaElIMC {
  CalculaElIMC({this.estatura, this.peso});

  final int estatura;
  final int peso;
  double _imc;

  String calculateBMI() {
    _imc = peso / pow(estatura / 100, 2);
    return _imc.toStringAsFixed(1);
  }

  String getResultado() {
    if (_imc < 18.5) {
      return 'Bajo peso';
    } else if (_imc >= 18.5 && _imc < 24.9) {
      return 'Peso normal';
    } else if (_imc >= 25.0 && _imc < 29.9) {
      return 'Sobrepeso';
    } else if (_imc >= 30.0 && _imc < 34.5) {
      return 'Obesidad grado I';
    } else if (_imc >= 35.0 && _imc < 39.9) {
      return 'Obesidad grado II';
    } else {
      return 'Obesidad grado II';
    }
  }

  String getConsejo() {
    if (_imc < 18.5) {
      return 'Su peso está por debajo de lo recomendado.';
    } else if (_imc >= 18.5 && _imc < 24.9) {
      return 'Tiene un peso corporal normal. ¡Buen trabajo!';
    } else if (_imc >= 25.0 && _imc < 29.9) {
      return 'Usted tiene sobrepeso. Debe hacer ejercicio y comer más saludable.';
    } else if (_imc >= 30.0 && _imc < 34.5) {
      return 'Usted tiene obesidad grado I. Debe visitar un nutricionista y a un médico general.';
    } else if (_imc >= 35.0 && _imc < 39.9) {
      return 'Usted tiene obesidad grado II y eso le genera riesgos altos para su salud.';
    } else {
      return 'Usted tiene obesidad grado III y eso le genera riesgos muy altos para su salud.';
    }
  }
}
