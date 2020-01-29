import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projecta/utility/my_constant.dart';
import 'package:projecta/utility/my_style.dart';
import 'package:projecta/utility/normal_dialog.dart'; //1

class Register extends StatefulWidget {
  //2
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //field
  File filePhoto;
  String name, password;
  //------------------------------------------------------
  //--> method
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print(name);
        if (filePhoto == null) {
          normalDialog(context, 'have no Avarta', 'plese create your Avarta');
        } else if (name == null || name.isEmpty) {
          normalDialog(context, 'name', 'plese add');
        } else if (password == null || password.isEmpty) {
          normalDialog(context, 'password', 'plese add');
        } else {
          uploadAvatar();
        }
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
      //child: Image.asset('images/avatar.png'),
      child: filePhoto == null
          ? Image.asset('images/avatar.png')
          : Image.file(filePhoto),
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
        getPhoto(ImageSource.camera); //--> connect camera phone.
      },
    );
  }

  //--> thred.--------------------------------------------
  Future<void> getPhoto(ImageSource imgSource) async {
    try {
      var obj = await ImagePicker.pickImage(
        source: imgSource,
        maxHeight: 800,
        maxWidth: 800,
        //imageQuality: 50
      );
      //-----------
      //--> set refresh.
      setState(() {
        filePhoto = obj;
      });
    } catch (e) {
      print(e);
    }
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
        getPhoto(ImageSource.gallery); //--> get gellery phone.
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
          onChanged: (String xx) {
            name = xx.trim();
          },
          style: TextStyle(color: colorIcon),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorIcon)),
              labelText: 'Name',
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
          onChanged: (String pass) {
            password = pass.trim();
          },
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
  //await function.
  Future<void> insertDB ()async{
      String avatar = 'https://www.androidthai.in.th/pte/avartar_ruthe/$name.jpg';
      String user = 'xxxx_user';
      String url ='https://www.androidthai.in.th/pte/addDataRuthe.php?isAdd=true&name=$name&user=$user&password=$password&avatar=$avatar';

      await Dio().get(url).then((res){
        if (res.toString() == 'true') {
          //--> close popup or black previos.
          Navigator.of(context).pop();
        } else {
          normalDialog(context, 'register', 'Error!');
        }
      });
  }

  //-----------------------------------------------------
  //await function.
  Future<void> uploadAvatar() async {
    try {
      Map<String, dynamic> map = Map();
      map['file'] = UploadFileInfo(filePhoto, '$name.jpg'); //name variable
      map['name'] = UploadFileInfo(filePhoto, '$name.jpg'); //name variable
      map['file'] = UploadFileInfo(filePhoto, '$name.jpg'); //name variable
      FormData formData = FormData.from(map);
      await Dio().post(
        MyConstant().urlAPIsaveFile,
        data: formData,
      ).then((res){
        print('res - $res');
        insertDB ();
      });
    } catch (e) {
      print(e);
    }
  }
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
