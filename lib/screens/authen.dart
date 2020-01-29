import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecta/main.dart';
import 'package:projecta/screens/register.dart';
import 'package:projecta/utility/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // field

  Widget userform() {
    return Container(
      width: 200,
      child: TextField(
          decoration: InputDecoration(
              hintText: 'User:',
              prefixIcon: Icon(Icons.alarm),
              hintStyle: TextStyle(color: MyStyle().taxtAColor))),
    );
  }

  Widget passwordform() {
    return Container(
      width: 200,
      child: TextField(
          decoration: InputDecoration(
              hintText: 'Pass:',
              prefixIcon: Icon(Icons.lock),
              hintStyle: TextStyle(color: MyStyle().taxtAColor))),
    );
  }

  // method
  Widget showAppName() {
    return Text("ruthe Building12314", style: MyStyle().pac_font);
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 300,
      child: Image.asset('images/logo.png'),
    );
  }

  //------------------ button -----------------------------------
  Widget signInButton() {
    return OutlineButton(
      borderSide: BorderSide(color: Colors.black),
      color: Colors.black,
      child: Text(
        'sign',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        print('you click sign up');

        //--> get page register.
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext buildContext){
            return Register();
          }
        );

        //--> call contrainner register.
        Navigator.of(context).push(materialPageRoute);

      },
    );
  }

  Widget logInButton() {
    return RaisedButton(
      color: MyStyle().color_b
      //borderSide: BorderSide(color: MyStyle().color_a),
      ,
      child: Text('login'),
      onPressed: () {},
    );
  }

  //-----------------------------------------------------
  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min //--> set to center
      ,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 10,
        ),
        logInButton()
      ],
    );
  }


  //-----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().mainColor],radius: 1.0
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                userform(),
                passwordform(),
                SizedBox(
                  height: 10,
                ),
                showButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
