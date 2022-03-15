
import 'dart:async';
import 'package:firstapp/timer_container.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimerScreenState();
  }

}
class TimerScreenState extends State<TimerScreen> {
  bool isActive = false;
  Timer? timer;
  int seconds = 0;
  int hours = 0;
  int mins = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer Screen"),),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerContainer(title: "Hours", value: "00"),
              TimerContainer(title: "Minutes", value: "00"),
              TimerContainer(title: "Seconds", value: seconds.toString(),)
            ],
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              timer = Timer.periodic(Duration(seconds: 1), (timer) {
                handleTick();
              });

              if(!isActive) {
                isActive = true;
              }
              else {
                isActive = false;
              }
            });
          }, child: Text(isActive? "Stop": "Start"))


        ],
      )
    );
  }

  void handleTick(){
    setState(() {
      seconds++;
    });
  }
  
}


