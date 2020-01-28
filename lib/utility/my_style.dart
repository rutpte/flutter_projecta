import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyle {
  Color taxtAColor =Colors.pink;
  Color color_a =Colors.pink;
  Color color_b =Color.fromARGB(0xff, 0x19, 0x76, 0xd2);//#1976d2
  //Color mainColor =Colors.yellow;
  Color mainColor = Color.fromARGB(0xff, 0x00, 0x4b, 0xa0);//#004ba0
  TextStyle pac_font = GoogleFonts.pacifico(
          textStyle: TextStyle(
            fontSize: 30,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          ),
        );

  MyStyle();
}