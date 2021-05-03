import 'dart:math';

class CalculaIMC {
  CalculaIMC({this.estatura, this.peso});

  final int estatura;
  final int peso;
  double _imc;

  String calculateBMI() {
    _imc = peso / pow(estatura / 100, 2);
    return _imc.toStringAsFixed(1);
  }

  String getResult() {
    if (_imc >= 25) {
      return 'Sobrepeso';
    } else if (_imc > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_imc >= 25) {
      return 'You have higher than normal body weight. Try exercising more.';
    } else if (_imc > 18.5) {
      return 'You have a normal body weight. Good job!.';
    } else {
      return 'You have lower than normal body weight. You can eat bit more.';
    }
  }
}
