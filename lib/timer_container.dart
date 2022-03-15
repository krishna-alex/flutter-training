import 'package:flutter/material.dart';

class TimerContainer extends StatelessWidget {

  String value, title;

  TimerContainer({required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Column(
        children: [
          Text("$value",
            style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          Text("$title",
            style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          )
          )
        ],

      ),
    );

  }


}