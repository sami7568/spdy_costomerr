import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:spdycustomers/Model/JsonData/signup_response.dart';
import 'package:spdycustomers/Widgets/progresshud.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/dataHandler/update_data.dart';
import 'package:spdycustomers/pages/Login/welcome.dart';
import 'package:spdycustomers/pages/Menu/home_page.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccRegistration extends StatefulWidget {
  const AccRegistration({Key? key}) : super(key: key);

  @override
  _AccRegistrationState createState() => _AccRegistrationState();
}

class _AccRegistrationState extends State<AccRegistration> with SingleTickerProviderStateMixin{

  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  TextEditingController cnfrmPassEditingController = TextEditingController();
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  bool? _isChecked = false;
  String? checknumber="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }
  ScrollController scrollController = new ScrollController();

  body(){
    return
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backgroundColor(),
        child: Padding(
            padding:
            const EdgeInsets.only(top: 60, bottom: 20, right: 35, left: 35),
            child: Stack(
              children: [
                getfields(),
                getcancelbutton(),
              ],
            ),
          ),
        );
  }
  getfields(){
    return Scaffold(
      backgroundColor: backgroundColor(),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Account Registeration",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "User Name",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                TextField(
                  controller: userNameEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "john cena",
                      hintStyle:
                      TextStyle(color: Colors.grey, fontSize: 14.0)),
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Cell Phone Number",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                TextField(
                  controller: phoneEditingController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "123-456-7890",
                      hintStyle:
                      TextStyle(color: Colors.grey, fontSize: 14.0)),
                  style: const TextStyle(fontSize: 18.0),
                  onChanged: (val){
                    if(checknumber!.length==0) {
                      setState(() {
                        checknumber = val;
                      });
                    }
                    else {
                      checknumber = checknumber! + val;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                TextField(
                  controller: emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      focusColor: Colors.black,
                      border: InputBorder.none,
                      filled: true,
                      hintText: "example@example.com",
                      fillColor: Colors.white,
                      hintStyle:
                      TextStyle(color: Colors.grey, fontSize: 15.0)),
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                TextField(
                  onChanged: (value) {

                  },
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
                      TextStyle(color: Colors.grey, fontSize: 15.0)),
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                TextField(
                  controller: cnfrmPassEditingController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      focusColor: Colors.black,
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Type Password here..",
                      hintStyle:
                      TextStyle(color: Colors.grey, fontSize: 15.0)),
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            /*const SizedBox(
              height: 10,
            ),*/
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
                      }
                    });
                  },
                ),
                const Text("Terms of Services",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //getcreateAccountButton(),
            signupButton(),
          ],
        ),
      ),
    );
  }

  //progress button
  signupButton(){
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
              text: 'Create Account',
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
                text: 'Create Account',
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
            String res = await validateCredentials();
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

  /*getcreateAccountButton(){
    return Center(
      child: GestureDetector(
        onTap: (){
          //validateCredentials();
        },
        child: Container(
          width: 280,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white),
          child: const Center(
              child: Text(
                "Create Account",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
      ),
    );
  }
  */
  getcancelbutton(){
    return  GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Welcome()));
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.cancel,
              color: Colors.white,
              size: 39,
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
    );
  }

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
  dynamic validateCredentials()async{
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
    String userName = userNameEditingController.text;
    String phone= phoneEditingController.text;
    String email = emailEditingController.text;
    String password = passEditingController.text;
    String confirmPass= cnfrmPassEditingController.text;
    String deviceType= (Platform.isIOS)?"IOS":"Android";

    if(password != confirmPass){
      // ignore: avoid_print
      print("password and confirm pass doesn't match");
      //dialoge
      return "failed";
    }
    else {
      if (userName.isEmpty || phone.isEmpty || email.isEmpty ||
          password.isEmpty || confirmPass.isEmpty || _isChecked==false) {
          // ignore: avoid_print
          print("fill your data please or check terms of condition");
          //dialoge
          awesomedialog('Failed', 'Please Fill All the fields.............',context);
          return "failed";
      }
      else {
        //please wait wala dialog
        //showdialog("Authenticating, Please Wait",context);
        print("signining");
        SignupResponse signupUserInfo =await ApiServices.signupRequest(
            userName, phone, email, password, deviceType);
         if(signupUserInfo!=null){
         makeFeildsEmpty();
         //Navigator.pop(context);
         if(signupUserInfo.userInfo!.email!.isNotEmpty){
          //save data using provider
          UpdateData().updateRegistrationData(signupUserInfo,context);
          return "login";
          //navigate to home page
        }
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
awesomedialog(String? title, String? desc,BuildContext context){
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.WARNING,
    animType: AnimType.BOTTOMSLIDE,
    title: title,
    desc: desc,
    btnOkOnPress: () {},
  )..show();
}
showdialog(String? mesg,BuildContext context){
  return showDialog(
      builder: (BuildContext context) {
        return ProgressDialog(message:mesg);
      },
      barrierDismissible: false,
      context: context);
}