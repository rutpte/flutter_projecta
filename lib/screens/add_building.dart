import 'package:flutter/material.dart';

class AddBuilding extends StatefulWidget {
  @override
  _AddBuildingState createState() => _AddBuildingState();
}

class _AddBuildingState extends State<AddBuilding> {
  //field

  //method
  Widget addBuildingButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, //make it to buttom.
      children: <Widget>[
        Container(
          width:
              MediaQuery.of(context).size.width, //make full size buttom on row
          child: RaisedButton(
            child: Text('Add Building'),
            onPressed: () {
              print('click add building');
            },
          ),
        ),
      ],
    );
  }

  //-------------------------------------------
  Widget showImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset('images/camera.png'),
    );
  }

  //-------------------------------------------
  Widget nameText() {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(hintText: 'Name:'),
      ),
    );
  }

  //-------------------------------------------
  Widget detailText() {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(hintText: 'Detail:'),
      ),
    );
  }
  //-------------------------------------------
  //map
  //-------------------------------------------
  Widget myContent() {
    return Column(
      children: <Widget>[
        showImage(),
        nameText(),
        detailText(),
      ],
    );
  }

  //-------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Building'),
      ),
      body: Stack(
        children: <Widget>[myContent(), addBuildingButton()],
      ),
    );
  }
}
