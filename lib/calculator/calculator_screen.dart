
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class CalculatorScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen>{
  final _TAG = "CalculatorScreen";
  TextEditingController number1Controller = new TextEditingController();
  TextEditingController number2Controller = new TextEditingController();
  double total = 0.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                controller: number1Controller,
                decoration: InputDecoration(
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
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                controller: number2Controller,
                decoration: InputDecoration(
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
            ElevatedButton(onPressed: (){
              developer.log("Text inside box text ${number1Controller.text}", name: _TAG);
              calculate();
            }, child: Text("Addition")),
            Text("$total")
          ],
        ),
      ),
    );
  }

  void calculate(){
    double firstNumber = double.parse(number1Controller.text);
    double secondNumber = double.parse(number1Controller.text);
    setState(() {
      total = firstNumber + secondNumber;
    });
  }
  
}