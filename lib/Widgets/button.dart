import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';

Widget pressedButtonn(String text) {
  return Center(
    child: Container(
      width: 280,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: buttonPressBlueColor()),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      )),
    ),
  );
}

Widget button(String text) {
  return Center(
    child: Container(
      width: 280,
      height: 60,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white
      ),
      child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
    ),
  );
}


Widget pressedButton(String text) {
  return Center(
    child: Container(
      width: 280,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: buttonPressColor()),
      child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
    ),
  );
}

Widget buttonn(String text) {
  return Center(
    child: Container(
      width: 230,
      height: 50,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white
      ),
      child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
    ),
  );
}




