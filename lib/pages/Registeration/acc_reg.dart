import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spdycustomers/Model/JsonData/bookingResponse.dart';
import 'package:spdycustomers/Model/JsonData/signupResponse.dart';
import 'package:spdycustomers/assistant/apiServices.dart';
import 'package:spdycustomers/assistant/requestAssistant.dart';
import 'package:spdycustomers/dataHandler/UpdateData.dart';
import 'package:spdycustomers/dataHandler/appData.dart';
import 'package:spdycustomers/pages/Login/welcome.dart';
import 'package:spdycustomers/pages/Menu/menu.dart';
import 'package:spdycustomers/pages/Menu/onlineNearby.dart';
import 'package:spdycustomers/pages/Registeration/loading.dart';
import 'package:spdycustomers/pages/Registeration/select_reg.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/prefdata.dart';

class Acc_reg extends StatefulWidget {
  @override
  _Acc_regState createState() => _Acc_regState();
}

class _Acc_regState extends State<Acc_reg> {

  TextEditingController userNameEditingController = new TextEditingController();
  TextEditingController phoneEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passEditingController = new TextEditingController();
  TextEditingController cnfrmPassEditingController = new TextEditingController();

  bool? _isChecked = false;
  String _currText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }

  body(){
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backgroundColor(),
        child: Padding(
          padding:
          const EdgeInsets.only(top: 70, bottom: 20, right: 35, left: 35),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Account Registeration",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      TextField(
                        controller: userNameEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "john cena",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0)),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cell Phone Number",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      TextField(
                        controller: phoneEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "123-456-7890",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0)),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      TextField(
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            focusColor: Colors.black,
                            border: InputBorder.none,
                            filled: true,
                            hintText: "example@example.com",
                            fillColor: Colors.white,
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15.0)),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      TextField(
                        onChanged: (value) {

                        },
                        controller: passEditingController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            focusColor: Colors.black,
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Type Password here..",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15.0)),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Confirm Password",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      TextField(
                        controller: cnfrmPassEditingController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            focusColor: Colors.black,
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Type Password here..",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15.0)),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        focusColor: Colors.white,
                        activeColor: Colors.white,
                        checkColor: Colors.blue,
                        hoverColor: Colors.white,

                        value: _isChecked,
                        onChanged: (val) {
                          setState(() {
                            _isChecked = val;
                            if (val == true) {
                              _currText = val.toString();
                            }
                          });
                        },
                      ),
                      Text("Terms of Services",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        validateCredentials();
                      },
                      child: Container(
                        width: 280,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Welcome()));
                },
                child: Container(
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
              ),
            ],
          ),
        ));
  }
  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
  validateCredentials()async{
    print("validating");
    // if(!validateStructure(passEditingController.text)){
    //   setState(() {
    //     String emailError="",passwordError="";
    //     String _usernameError = emailError;
    //     String _passwordError = passwordError;
    //   });
    //   // show dialog/snackbar to get user attention.
    //   return;
    // }
    // Continue
    String userName = userNameEditingController.text;
    String phone= phoneEditingController.text;
    String email = emailEditingController.text;
    String password = passEditingController.text;
    String confirmPass= cnfrmPassEditingController.text;
    String deviceType= (Platform.isIOS)?"IOS":"Android";

    if(password != confirmPass){
      print("password and confirm pass doesn't match");
      //dialoge
      return;
    }
    else {
      if (userName.isEmpty || phone.isEmpty || email.isEmpty ||
          password.isEmpty || confirmPass.isEmpty || _isChecked==false) {
          print("fill your data please or check terms of condition");
          //dialoge
      }
      else {
        //please wait wala dialog

        makeFeildsEmpty();
        SignupUserInfo signupUserInfo =await ApiServices.signupRequest(
            userName, phone, email, password, deviceType);
        if(signupUserInfo.email!.isNotEmpty){
          
          //save data using provider
          UpdateData().updateRegistrationData(signupUserInfo,context);
          
          //navigate to home page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      }
    }
  }
  makeFeildsEmpty(){
    userNameEditingController.text = "";
    phoneEditingController.text = "";
    emailEditingController.text = "";
    passEditingController.text = "";
    cnfrmPassEditingController.text = "";
  }
}
