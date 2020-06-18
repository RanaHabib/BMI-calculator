import 'dart:math';

class BMIbrain{
  BMIbrain({this.height,this.weight});
  int height;
  int weight;
  double _bmi;
  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi >=18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getDescreption(){
    if(_bmi>=25){
      return 'Your weight is high, you need more excercise.';
    }
    else if(_bmi >=18.5){
      return 'Your weight is normal, that\'s good!';
    }
    else{
      return 'Your weight is lower than normal, eat more!';
    }
  }
}
