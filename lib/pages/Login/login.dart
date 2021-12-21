import 'package:flutter/material.dart';
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
                    const SizedBox(height: 15,),
                    const Text("Enter your Login info to access your SPDY Account", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Phone Number", style: TextStyle(fontSize: 15, color: Colors.white),),
                        TextField(
                          controller: phoneEditingController,
                          keyboardType: TextInputType.number,
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
                          keyboardType: TextInputType.visiblePassword,
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
                    const SizedBox(height: 100,),

                    GestureDetector(
                      onTap: () async{
                        validate();
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
                    ),
                  ],
                ),
                Container(
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
                ),
              ],
            ),
          )),
    );
  }
    validate()async{
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
        awesomedialog("Error","Please fill all the fields", context);
      return;
      }
      else {
       // showdialog("please wait", context);
        LoginResponse res =  await ApiServices.loginUser(phone, password);
      //   Navigator.pop(context);
        if(res.status==200){
          //dialog
          //save provider data
          UpdateData().updateLoginData(res,context);
          makeFeildsEmpty();
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString(Data.siginkey!, "true");

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const HomePage()));
        }
        else{
          //dialog
          awesomedialog("Error",res.msg, context);
          // ignore: avoid_print
          print("failed");
        }
    }
  }
    makeFeildsEmpty(){
    phoneEditingController.text = "";
    passEditingController.text = "";
  }

}
