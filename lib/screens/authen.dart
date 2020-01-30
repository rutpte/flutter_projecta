import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projecta/models/user_model.dart';
import 'package:projecta/screens/my_service.dart';
import 'package:projecta/screens/register.dart';
import 'package:projecta/utility/my_style.dart';
import 'package:projecta/utility/normal_dialog.dart';
import 'package:dio/dio.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // field
  String user, password;

  //mathod
  Widget userform() {
    return Container(
      width: 200,
      child: TextField(
          onChanged: (String str_user) {
            user = str_user.trim();
          },
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
          onChanged: (String strPass) {
            password = strPass.trim();
          },
          obscureText: true, //-> password type.
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

        //--> get page register. and can black.
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });

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
      onPressed: () {
        if (user == null || user.isEmpty) {
          normalDialog(context, 'user', 'empty');
        } else if (password == null || password.isEmpty) {
          normalDialog(context, 'password', 'empty');
        } else {
          Future<void> checkAuthen() async {
            String url =
                'https://www.androidthai.in.th/pte/getUserWhereUserMasterRuthe.php?isAdd=true&user=$user&password=$password';
            Response res = await Dio().get(url);
            print(res);

            if (res.toString() == 'null') {
              normalDialog(context, 'user', 'can not find user.');
            } else {
              //go some page.
              var raw_rs = jsonDecode(res.data);
              var rs = raw_rs[0];
              UserModel userModel = UserModel.fromJson(rs);
              if (userModel.password == password) {
                normalDialog(context, 'status', 'ok');

                //--> make page route full.
                /*
                MaterialPageRoute materialPageRoute =
                    MaterialPageRoute(builder: (BuildContext buildContext) {

                  return MyServices();
                });
                */

                //--> make page route short.
                MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext buildContext)=> MyServices());
                Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route){return false;});
              } else {
                normalDialog(context, 'status', 'fail');
              }

              print(rs);
              print('login successfully');
            }
            /*await Dio().get(url).then((res) {
              if (res.toString() == 'true') {
                //--> close popup or black previos.
                Navigator.of(context).pop();
              } else {
                normalDialog(context, 'register', 'Error!');
              }
            });*/
          }

          //---
          checkAuthen();
        }
      },
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
              colors: <Color>[Colors.white, MyStyle().mainColor], radius: 1.0),
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
