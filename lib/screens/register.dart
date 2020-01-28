import 'package:flutter/material.dart';
import 'package:projecta/utility/my_style.dart'; //1

class Register extends StatefulWidget { //2
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //3
      appBar: AppBar(backgroundColor: MyStyle().color_bar,),
    );
  }
}