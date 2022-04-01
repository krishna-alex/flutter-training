
import 'package:firstapp/calculator/calculation_functions.dart';
import 'dart:developer' as developer;

class Calculator implements CalculationFunctions{
  String TAG = "Calculator";
  @override
  int addition(int a, int b) {
    int answer = a+ b;
    return answer;
  }

  @override
  double multiplication(double a, double b) {
    double answer = a * b;
    return answer;
  }

  @override
  int subtraction(int a, int b) {
    int answer = a - b;
    return answer;
  }

  @override
  double division(double a, double b) {
    double answer = 0;
    try{
      answer = a/b;
    }
    catch (e){
      developer.log("Exception in division $e", name: TAG );
    }
    return answer;

  }

}