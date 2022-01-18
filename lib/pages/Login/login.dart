import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spdycustomers/Model/JsonData/login_response.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/dataHandler/update_data.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Menu/home_page.dart';
import 'package:spdycustomers/pages/Registeration/acc_reg.dart';
import 'package:spdycustomers/prefdata.dart';

import '../../Model/JsonData/login_response.dart';
import '../../assistant/api_services.dart';
import '../../dataHandler/update_data.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  ScrollController scrollController = new ScrollController();
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: body(),
    );
  }
  body(){
    return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 40, right: 35, left: 35),
            child: Stack(
              children: [
                fields(),
                registrerhere(),
              ],
            ),
          ));
  }

  fields(){
    return SingleChildScrollView(
      reverse: true,
      controller: scrollController,
      scrollDirection:Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15,),
          const Text("Enter your Login info to access your SPDY Account", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          const SizedBox(height: 50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Phone Number", style: TextStyle(fontSize: 15, color: Colors.white),),
              TextField(
                controller: phoneEditingController,
                keyboardType: TextInputType.phone,
                autofocus: true,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "123-456-789",
                    hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 14.0)),

                style: const TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 20,),

              const Text("Password", style: TextStyle(fontSize: 15, color: Colors.white),),
              TextField(
                controller: passEditingController,
                obscureText: true,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                    focusColor: Colors.black,
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Type Password here..",
                    hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 13.0)),

                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
              alignment: Alignment.bottomRight,
              child: const Text("Forget Password", style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline))),
          SizedBox(height:(MediaQuery.of(context).size.height*10)/100,),
          loginbutton()],
      ),
    );
  }

  simpleloginbutton(){
    return GestureDetector(
      onTap: () async{
        validateCredentials();
      },
      child: Center(
        child: Container(
          width: 280,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: buttonPressBlueColor()
          ),
          child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
      ),
    );
  }
  registrerhere(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't Have an Account? ", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
          GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const AccRegistration()));
              },
              child:const Text("Register", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
        ],
      ),
    );
  }
  Future<String> validateCredentials()async{
    // ignore: avoid_print
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
        // ignore: avoid_print
        print("fill your data please");
        //dialogue
        awesomedialog("Error","Please fill all the fields", context);
        return "failed";
      }
      else {
       // showdialog("please wait", context);
        LoginResponse res =  await ApiServices.loginUser(phone, password);
//        Navigator.pop(context);
  //      Navigator.pop(context);
        if(res!=null){
        if(res.userInfo!.email!.isNotEmpty){
          //save provider data
          UpdateData().updateLoginData(res,context);
          makeTextFeildsEmpty();
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString(Data.siginkey!, "true");
          await pref.setString(Data.userId!,res.userInfo!.userId!);
          await pref.setString(Data.userName!, res.userInfo!.userName!);
          await pref.setString(Data.signupemail!, res.userInfo!.email!);
          String? name = await pref.getString(Data.userName!);
          print(name);
          return "login";
        }
        else{
          //dialog
          awesomedialog("Error",res.msg, context);
          // ignore: avoid_print
          print("failed");
          return "failed";
        }
        }
        else{
          showdialog("Error", context);
          return "failed";
        }
    }
  }

  //progress button
  loginbutton(){
    return Center(
      child: ProgressButton.icon(
        textStyle: const TextStyle(
          fontSize: 23,
          color: Colors.white,
        ),
          height: 60.0,
          maxWidth: 280.0,
          iconedButtons: {
        ButtonState.idle:  IconedButton(
            text: 'Login',
            icon: Icon(Icons.login, color: Colors.white),
            color: buttonPressBlueColor(),
        ),
        ButtonState.loading:
        IconedButton(text: 'Loading', color: Colors.white ),
        ButtonState.fail: IconedButton(
            text: 'Failed',
            icon: Icon(Icons.cancel, color: Colors.white),
            color: buttonPressBlueColor()),
        ButtonState.success: IconedButton(
            text: 'Login',
            icon: Icon(
              Icons.check_circle, color: Colors.white,
            ),
            color: buttonPressBlueColor())
      },
          onPressed: onPressedIconWithText, state: stateTextWithIcon),
    );
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(
          Duration(seconds: 1),
              () async {
                String res =await validateCredentials();
                if(res!="failed"){
                  setState(
                  () {
                        stateTextWithIcon =ButtonState.success;
              },
            );
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const HomePage()));
          }
                else{
                  Fluttertoast.showToast(msg: "Incorrect phone Number or Password");
                  setState(() {
                    stateTextWithIcon = ButtonState.idle;
                  });
                }
                },
        );

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(
          () {
        stateTextWithIcon = stateTextWithIcon;
      },
    );
  }

  makeTextFeildsEmpty(){
    phoneEditingController.text = "";
    passEditingController.text = "";
  }

}
