import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class Register_1 extends StatefulWidget {

  @override
  _Register_1State createState() => _Register_1State();
}

class _Register_1State extends State<Register_1> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  body(){
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child:
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 30, right: 35, left: 35),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/spdy.svg"),

                    SizedBox(height: 50,),
                    Text("Email or Phone Number", style: TextStyle(fontSize: 16, color: Colors.white),),
                    TextField(

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "example@example.com",
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 15.0)),

                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 20,),

                    Text("Password", style: TextStyle(fontSize: 16, color: Colors.white),),
                    TextField(
                      obscureText: true,

                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          focusColor: Colors.black,
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Type password here..",
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 10.0)),

                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 10,),
                    Container(


                        alignment: Alignment.bottomRight,
                        child: Text("Forget Password", style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline))),
                    SizedBox(height: 100,),


                    Center(
                      child: Container(
                        width: 280,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white
                        ),
                        child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
