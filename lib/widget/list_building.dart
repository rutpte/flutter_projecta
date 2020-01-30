import 'package:flutter/material.dart';
import 'package:projecta/screens/add_building.dart';

class ListBuilding extends StatefulWidget {
  @override
  _ListBuildingState createState() => _ListBuildingState();
}

class _ListBuildingState extends State<ListBuilding> {
  //field

  //method
  Widget addBuildingButtton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: 20.0,
                bottom: 20.0,
              ),
              child: FloatingActionButton(
                //--> postion absolube.
                child: Icon(Icons.add),
                onPressed: () {
                  //--get page add Building.
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context){return AddBuilding();});

                  //--> draw page that can go black.
                  Navigator.of(context).push(materialPageRoute);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  //-------------------------------
  Widget showListView() {
    return ListView(
      children: <Widget>[
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
        Text('xxxxx'),
      ],
    );
  }

  //-------------------------------
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        showListView(),
        addBuildingButtton(),
      ],
    );
  }
}
