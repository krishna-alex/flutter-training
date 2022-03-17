
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
  @protected
  @mustCallSuper
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      handleTick();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer Screen"),),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerContainer(title: "Hours", value: (seconds/3600).toInt().toString()),
              TimerContainer(title: "Minutes", value: (seconds/60).toInt().toString()),
              TimerContainer(title: "Seconds", value: (seconds%60).toInt().toString(),)
            ],
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              isActive = !isActive;
            });
          }, child: Text(isActive? "Stop": "Start"))


        ],
      )
    );
  }

  void handleTick(){
    if (!isActive) return;
    setState(() {
      seconds++;
    });
  }
  
}


