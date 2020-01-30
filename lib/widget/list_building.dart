import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projecta/models/building_model.dart';
import 'package:projecta/screens/add_building.dart';
import 'package:projecta/utility/my_constant.dart';

class ListBuilding extends StatefulWidget {
  @override
  _ListBuildingState createState() => _ListBuildingState();
}

class _ListBuildingState extends State<ListBuilding> {
  //field
  List<BuildingModel> buildingModels = List(); //just create empty array.

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
                  MaterialPageRoute materialPageRoute =
                      MaterialPageRoute(builder: (BuildContext context) {
                    return AddBuilding();
                  });

                  //--> draw page that can go black.
                  Navigator.of(context)
                  .push(materialPageRoute)
                  .then((rs) {
                    redAllData();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  //-------------------------------
  //--> first run.
  @override
  void initState() {
    super.initState();
    redAllData();
  }

  //-------------------------------
  //--> therd sleep and exute
  Future<void> redAllData() async {

    if (buildingModels.length > 0){
      buildingModels.clear();
    }
      
    
    //ajax read data from server
    Response response = await Dio().get(MyConstant().urlAPIreadAllBuilding);
    var rs = json.decode(response.data); //why .data?
    print(rs);
    for (var map in rs) {
      BuildingModel buildingModel = BuildingModel.fromJson(map);
      setState(() {
        buildingModels.add(buildingModel);
      });
    }
  }

  //-------------------------------
  Widget showListView() {
    return ListView.builder(
      itemCount: buildingModels.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            showImages(index),
            showText(index),
          ],
        );
      },
    );
  }

  //-------------------------------
  Widget showImages(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Image.network(
        buildingModels[index].urlImage,
        fit: BoxFit.cover,
      ),
    );
  }

  //-------------------------------
  Widget showText(int index) {
    return Column(
      children: <Widget>[
        Text(buildingModels[index].name),
        Text(buildingModels[index].detail),
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
