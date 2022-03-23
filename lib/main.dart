
import 'package:flutter/material.dart';
import 'package:firstapp/timerScreen.dart';
import 'package:firstapp/calculator/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome Krishna", textScaleFactor: 2 ),
            ElevatedButton(onPressed: (){
               startTimerScreen(context);
            }, child: Text("Start timer screen")),
            ElevatedButton(onPressed: (){
              startCalculatorScreen(context);
            }, child: Text("Start Calculator Screen")),
          ],
        ),
      ),
    );
  }

  void startTimerScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreen()));
  }
  void startCalculatorScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen()));
  }
}


