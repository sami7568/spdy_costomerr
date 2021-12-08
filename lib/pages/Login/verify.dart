import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spdycustomers/Widgets/colors.dart';

import 'loading.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passEditingController = new TextEditingController();

  TextEditingController textEditingController = TextEditingController();

  Color submitColor = Colors.white;


  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, bottom: 20, right: 35, left: 35),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Two-Step Verification",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please Enter the 6-Digit code sent via Email or Text to access your account.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 180,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,

                      hintCharacter: "0",
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      onCompleted: (v) {
                        print("Completed");
                        submitColor = buttonPressBlueColor();
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoadingLogin()));
                      },
                      child: Center(
                              child: Container(
                                width: 280,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: submitColor),
                                child: Center(
                                    child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: submitColor == buttonPressBlueColor()? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("dilaog click");
                        dialog();
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Resend code",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
  void dialog() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    "We've sent a new\n6-Digit code to your Email.", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                Icon(
                  Icons.check_circle_outlined,
                  size: 80,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }
}


