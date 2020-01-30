import 'package:flutter/material.dart';  //tool for draw state less or sgreen
import 'package:projecta/screens/authen.dart';

//--> method main.
void main() {
  runApp(MyApp());
  
}

//--> state less.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(brightness: Brightness.dark),
      home: Authen(),
    );
  }
}
