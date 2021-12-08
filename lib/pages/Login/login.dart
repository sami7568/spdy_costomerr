import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/Model/JsonData/loginResponse.dart';
import 'package:spdycustomers/assistant/apiServices.dart';
import 'package:spdycustomers/dataHandler/UpdateData.dart';
import 'package:spdycustomers/dataHandler/appData.dart';
import 'package:spdycustomers/pages/Login/verify.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Menu/onlineNearby.dart';
import 'package:spdycustomers/pages/Registeration/acc_reg.dart';

import '../../Model/JsonData/loginResponse.dart';
import '../../assistant/apiServices.dart';
import '../../dataHandler/UpdateData.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController phoneEditingController = new TextEditingController();
  TextEditingController passEditingController = new TextEditingController();

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
            padding: const EdgeInsets.only(top: 100, bottom: 20, right: 35, left: 35),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text("Enter your Login info to access your SPDY Account", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                    SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number", style: TextStyle(fontSize: 15, color: Colors.white),),
                        TextField(
                          controller: phoneEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "123-456-789",
                              hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14.0)),

                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 20,),

                        Text("Password", style: TextStyle(fontSize: 15, color: Colors.white),),
                        TextField(
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
                              TextStyle(color: Colors.grey, fontSize: 13.0)),

                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Text("Forget Password", style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline))),
                    SizedBox(height: 100,),

                    GestureDetector(
                      onTap: () async{
                        validate();
                        //dynamic res  = await ApiServices.user_booking_list();
                        // if(res==200){
                        //   print("pass");
                        // }
                        // else{
                        //   print(" hhhh failed");
                        // }
                      },
                      child: Center(
                        child: Container(
                          width: 280,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: buttonPressBlueColor()
                          ),
                          child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an Account? ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => Acc_reg()));
                          },
                          child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }


    validate()async{
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
    String phone= phoneEditingController.text;
    String password = passEditingController.text;

      if (phone.isEmpty || password.isEmpty ) {
        print("fill your data please");
      return;
      }
      else {
       LoginResponse res =  await ApiServices.loginUser(phone, password);
        if(res.status==200){
          //dialog
          //save provider data
          UpdateData().updateLoginData(res,context);
          makeFeildsEmpty();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        else{
          //dialog

          print("failed");
        }
    }
  }
    makeFeildsEmpty(){
    phoneEditingController.text = "";
    passEditingController.text = "";
  }

}
