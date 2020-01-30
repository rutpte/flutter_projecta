import 'package:flutter/material.dart';
import 'package:projecta/widget/list_building.dart';

class MyServices extends StatefulWidget {
  @override
  _MyServicesState createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {

  //field
  Widget currentWidget = ListBuilding();

  //method
  //--> menu
  Widget showDrawer(){
    return Drawer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my services'),
      )
      ,drawer: showDrawer()//menu 
      ,body: currentWidget,
    );
  }
}
