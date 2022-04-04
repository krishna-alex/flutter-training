import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class InputFieldContainer extends StatelessWidget{

  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? hint;


  InputFieldContainer({this.textInputType, this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        controller: controller!,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText:  '$hint',
            hintStyle: const TextStyle(color: Colors.black38),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.orange)
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide(color: Colors.blue)
            )
        ),
      ),
    );

  }

}