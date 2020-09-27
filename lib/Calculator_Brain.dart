import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});
  final int weight;
  final int height;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);//AsFixed(1) gives us one digit after the common
  }
  String calculateMaximum(){
    double maximum= 25*pow(height/100,2);
    return maximum.toStringAsFixed(1);
  }
  String calculateMinimum(){
    double minimum =18.5*pow(height/100,2);
    return minimum.toStringAsFixed(1);
  }
  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }
String getInterpretation(){
  if (_bmi >= 25)
    return 'You have a higher than normal body weight. Try to exercise more.';
  else if (_bmi > 18.5)
    return 'You have a normal body weight. Good job!';
  else
    return 'You have lower than normal body weight. You should eat more.';
}
}