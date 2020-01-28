import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // field

  // method
  Widget showAppName() {
    return Text("ruthe Building12");
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 300,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[showLogo(), showAppName()],
        ),
      ),
    );
  }
}
