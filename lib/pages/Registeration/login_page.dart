import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class Register1 extends StatefulWidget {
  const Register1({Key? key}) : super(key: key);

  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
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

                    const  SizedBox(height: 50,),
                    const Text("Email or Phone Number", style: TextStyle(fontSize: 16, color: Colors.white),),
                    const TextField(

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
                    const SizedBox(height: 20,),

                    const Text("Password", style: TextStyle(fontSize: 16, color: Colors.white),),
                    const TextField(
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
                    const  SizedBox(height: 10,),
                    Container(


                        alignment: Alignment.bottomRight,
                        child:const Text("Forget Password", style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline))),
                    const SizedBox(height: 100,),


                    Center(
                      child: Container(
                        width: 280,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white
                        ),
                        child: const Center(
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
