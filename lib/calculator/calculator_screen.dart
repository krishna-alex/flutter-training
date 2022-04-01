
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:firstapp/calculator/calculation_functions.dart';
import 'package:firstapp/calculator/calculator.dart';
import 'package:firstapp/calculator/arithmetic_enums.dart';


class CalculatorScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen>{
  final _TAG = "CalculatorScreen";
  TextEditingController number1Controller = new TextEditingController();
  TextEditingController number2Controller = new TextEditingController();
  double total = 0.0;
  Calculator calculationFunctions = new Calculator();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: number1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter number 1',
                      hintStyle: TextStyle(color: Colors.black38),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Colors.orange)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Colors.blue)
                      )
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter number 2',
                      hintStyle: TextStyle(color: Colors.black38),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Colors.orange)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Colors.blue)
                      )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ElevatedButton(onPressed: (){
                  developer.log("Text inside box text ${number1Controller.text}", name: _TAG);
                  calculate(ArithmeticOperations.ADDITION);
                }, child: Text("Addition")),
                ElevatedButton(onPressed: (){
                calculate(ArithmeticOperations.SUBTRACTION);
                },child: Text("Subtract")),
                ],
              ),
              ElevatedButton(onPressed: (){
                calculate(ArithmeticOperations.MULTIPLICATION);
              }, child: Text("Multiply")),
              ElevatedButton(onPressed: (){
                calculate(ArithmeticOperations.DIVISION);
              }, child: Text("Divide")),
              Text("$total")
            ],
          ),
        ),
      ),
    );
  }

  void calculate(ArithmeticOperations operationSelected){
    total = 0.0;
    if(operationSelected == ArithmeticOperations.ADDITION) {
      int firstNumber = int.parse(number1Controller.text);
      int secondNumber = int.parse(number2Controller.text);
      int answer = calculationFunctions.addition(firstNumber, secondNumber);
      setState(() {
        total = total + answer;
      });
    }
    else if(operationSelected == ArithmeticOperations.SUBTRACTION) {
      int firstNumber = int.parse(number1Controller.text);
      int secondNumber = int.parse(number2Controller.text);
      int answer = calculationFunctions.subtraction(firstNumber, secondNumber);
      setState(() {
        total = total + answer;
      });
    }
    else if(operationSelected == ArithmeticOperations.MULTIPLICATION){
      double firstNumber = double.parse(number1Controller.text);
      double secondNumber = double.parse(number2Controller.text);
      double answer = calculationFunctions.multiplication(firstNumber, secondNumber);
      setState(() {
        total = total + answer;
      });
    }
    else if(operationSelected == ArithmeticOperations.DIVISION){
      double firstNumber = double.parse(number1Controller.text);
      double secondNumber = double.parse(number2Controller.text);
      double answer = calculationFunctions.division(firstNumber, secondNumber);
      setState(() {
        total = total + answer;
      });
    }
  }
  
}