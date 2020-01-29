import 'package:flutter/material.dart';
import 'package:projecta/utility/my_style.dart'; //1

class Register extends StatefulWidget {
  //2
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //field

  //------------------------------------------------------
  //--> method
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('xxxx');
      },
    );
  }

  //------------------------------------------------------
  //widget avatar
  Widget ShowAvatar() {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Image.asset('images/avatar.png'),
    );
  }

  //------------------------------------------------------
  Widget cameraButton() {
    return IconButton(
      icon: Icon(
        Icons.add_a_photo,
        color: Colors.cyan,
      ),
      onPressed: () {
        print('xxxx');
      },
    );
  }

  //------------------------------------------------------
  Widget galleryButton() {
    return IconButton(
      icon: Icon(
        Icons.add_photo_alternate,
        color: Colors.cyan,
      ),
      onPressed: () {
        print('xxxx');
      },
    );
  }
  //------------------------------------------------------

  Widget showButtonPhoto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[cameraButton(), galleryButton()],
    );
  }

  //------------------------------------------------------
  Widget textName() {
    Color colorIcon = Colors.cyan;
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextField(
          style: TextStyle(color: colorIcon),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorIcon)),
              labelText: 'User',
              helperStyle: TextStyle(color: colorIcon),
              labelStyle: TextStyle(color: colorIcon),

              //hintText: 'User:',
              icon: Icon(
                Icons.face,
                size: 36.0,
                color: colorIcon,
              ),
              //prefixIcon: Icon(Icons.alarm),
              hintStyle: TextStyle(color: MyStyle().taxtAColor))),
    );
  }

  //------------------------------------------------------
  Widget textPass() {
    Color colorIcon = Colors.cyan;
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextField(
          style: TextStyle(color: colorIcon),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorIcon)),
              helperText: 'helperText',
              helperStyle: TextStyle(color: colorIcon),
              labelText: 'Password',
              labelStyle: TextStyle(color: colorIcon),
              //hintText: 'Pass:',
              icon: Icon(
                Icons.ac_unit,
                size: 36.0,
                color: colorIcon,
              ),
              //prefixIcon: Icon(Icons.alarm),
              hintStyle: TextStyle(color: MyStyle().taxtAColor))),
    );
  }
  //------------------------------------------------------
  //------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //3
      appBar: AppBar(
        backgroundColor: MyStyle().color_bar,
        actions: <Widget>[registerButton()],
        title: Text('Register'),
      ),
      //----------------
      body: ListView(
        children: <Widget>[
          ShowAvatar(),
          showButtonPhoto(),
          textName(),
          textPass(),
          //SizedBox(height: 100,)
        ],
      ),
      //-----------------
    );
  }
}
