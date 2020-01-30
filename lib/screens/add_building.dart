import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:projecta/utility/my_constant.dart';
import 'package:projecta/utility/normal_dialog.dart';

class AddBuilding extends StatefulWidget {
  @override
  _AddBuildingState createState() => _AddBuildingState();
}

class _AddBuildingState extends State<AddBuilding> {
  //field
  double lat, lon;
  LatLng latLng;
  File filePhoto;
  String name,detail,urlImage;
  String nameFile;

  //method

  //---> work before build app.
  @override
  void initState() {
    super.initState();
    findLonLat();
  }

  //-> thead
  Future<void> findLonLat() async {
    //--> sleep thead 10 sec.
    Duration duration = Duration(seconds: 10);
    await Timer(duration, () {
      //--> after sleep timee

      //--> draw new state.
      setState(() {
        lat = 13.703856;
        lon = 100.568742;
      });
    });
  }

  Future<void> findLatlng() async {
    LocationData locationData = await findLatlngData();
    setState(() {
      lat = locationData.latitude;
      lon = locationData.longitude;
    });
  }

  Future<LocationData> findLatlngData() async {
    var location = Location();
    try {
      return await location.getLocation(); //get current location.
    } catch (e) {}
  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        position: latLng
        ,markerId: MarkerId('myPosition'),
      ),
    ].toSet();
  }

  Widget showDetailMap() {
    latLng = LatLng(lat, lon);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16);

    return GoogleMap(
      markers: myMarker(),
      mapType: MapType.hybrid,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController googleMapController) {},
    );
  }

  Widget showMap() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: lat == null
          ? Center(
              child: CircularProgressIndicator(), //module load.
            )
          : showDetailMap(),
    );
  }

//--------------------------------
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
              if (filePhoto == null) {
                normalDialog(context, 'xxxx', 'xxxx');
              } else if (name==null || name.isEmpty || detail==null || detail.isEmpty) {
                normalDialog(context, 'no have filed', 'ho have filed');
              }else{
                //success validate.
                 uploadImgToServer();
              }
            },
          ),
        ),
      ],
    );
  }

  //-------------------------------------------
  Widget showImage() {
    return GestureDetector(
      onTap: (){
        print('show img');
        cameraAction();
      },
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: filePhoto == null? Image.asset('images/camera.png') : Image.file(filePhoto)
      ),
    );
  }

  //-------------------------------------------
  Future<void> cameraAction()async{
    try {
      var obj = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 800,maxHeight: 800,);//show camera phone.
      setState(() {
        filePhoto = obj;
      });
    } catch (e) {
    }
  }
  //-------------------------------------------
  Widget nameText() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (String strName){
          name = strName.trim();
        },
        decoration: InputDecoration(hintText: 'Name:'),
      ),
    );
  }

  //-------------------------------------------
  Widget detailText() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (String strName){
          detail = strName.trim();
        },
        decoration: InputDecoration(hintText: 'Detail:'),
      ),
    );
  }

  //-------------------------------------------
  //map
  //-------------------------------------------
  Widget myContent() {
    return SingleChildScrollView(//--> can scroll
          child: Column(
        children: <Widget>[showImage(), nameText(), detailText(), showMap()],
      ),
    );
  }

  //-------------------------------------------
  Future<void> uploadImgToServer()async{

    //--> random name.
    Random random = Random();
    int i = random.nextInt(1000);
    nameFile = 'building_$i.jpg';

    try {
      Map<String,dynamic> map = Map();
      map['file'] = UploadFileInfo(filePhoto, nameFile);

      //->pack data to ajax.
      FormData formData = FormData.from(map);
      await Dio().post(
        MyConstant().urlAPIsaveFile//url to server.php
        , data: formData
      ).then((res){
          print('res$res');
          //normalDialog(context, 'status', 'upload complete');
          insertDataToserver();
      });
    } catch (e) {
      print(e);
    }

  }
  //-------------------------------------------
  Future<void> insertDataToserver()async{
    urlImage = 'https://www.androidthai.in.th/pte/avartar_ruthe/$nameFile';
    String url = 'https://www.androidthai.in.th/pte/addBuilding.php?isAdd=true&Name=$name&Detail=$detail&UrlImage=$urlImage&Lat=lat&Lng=$lon';

    Response response = await Dio().get(url);
    if (response.toString() == 'true') {
      Navigator.of(context).pop();//go back page.
      normalDialog(context, 'status', 'ok complete');
    } else {
      normalDialog(context, 'status', 'upload fail please try again');
    }
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
