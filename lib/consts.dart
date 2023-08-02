import 'package:flutter/material.dart';

var backGroundColor = const Color.fromRGBO(0, 0, 0, 1.0);
var blueColor = const Color.fromRGBO(0, 149, 246, 1);
var primaryColor = Colors.white;
var secondaryColor = const Color.fromARGB(255, 150, 146, 146);
var darkGreyColor = const Color.fromRGBO(61, 61, 61, 1);
var greenyColor = const Color.fromARGB(255, 51, 109, 65);

Widget sizeVer(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sizeHor(double width) {
  return SizedBox(width: width);
}
