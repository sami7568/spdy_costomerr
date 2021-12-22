import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spdycustomers/Model/JsonData/login_response.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/pages/PaymentSetting/pay_account_settings.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Registeration/acc_reg.dart';
import 'package:spdycustomers/prefdata.dart';

class PaymentSetting extends StatefulWidget {
  const PaymentSetting({Key? key}) : super(key: key);


  @override
  _PaymentSettingState createState() => _PaymentSettingState();
}

class _PaymentSettingState extends State<PaymentSetting> {

  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


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
          Stack(
              children: [
                getfields(),
                getMenuButton(),
              ]
          )
      ),
    );
  }

  getfields(){
    return Padding(
      padding: const EdgeInsets.only(top: 80, right: 35, left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Payment Settings", style: TextStyle(fontSize: 24, color: Colors.white , fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
          const Text("For security purposes, we require password to access your Account Settings.", style: TextStyle(fontSize: 18, color: Colors.white),),
          getCoulumn(),
          const SizedBox(height: 50,),
          const SizedBox(height: 100,),
          getsubmitbutton(),
        ],
      ),
    );
  }

  getCoulumn(){
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text("Email or Phone Number", style: TextStyle(fontSize: 15, color: Colors.white),),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "034900000000",
                hintStyle:
                 TextStyle(color: Colors.grey, fontSize: 15.0)),

            style:const TextStyle(fontSize: 14.0, color: Colors.black),
          ),
          const  SizedBox(height: 20,),

          const Text("Password", style: TextStyle(fontSize: 15, color: Colors.white),),
          TextField(
            obscureText: true,
            controller: passController,
            keyboardType: TextInputType.visiblePassword,
            decoration:const InputDecoration(
                focusColor: Colors.black,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "********",
                hintStyle:
                TextStyle(color: Colors.grey, fontSize: 10.0)),
            style:const TextStyle(fontSize: 14.0),
          ),
        ],
      );
  }
  getsubmitbutton(){
    return Center(
      child: GestureDetector(
        onTap: (){
          validating();
        },
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
    );
  }

  validating() async{
    String phone= phoneController.text;
    String password = passController.text;
    if (phone.isEmpty || password.isEmpty ) {
      // ignore: avoid_print
      print("fill your data please");
      //dialogue
      awesomedialog("Error","Please fill all the fields", context);
      return;
    }
    else {
      LoginResponse res =  await ApiServices.loginUser(phone, password);
      if(res.status==200){
        SharedPreferences pref =await SharedPreferences.getInstance();
        String? userId = await pref.getString(Data.userId!);
        if (userId == res.userInfo!.userId!){
          makeTextFeildsEmpty();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PayAccountSettings()));
        }
        else
          {
            awesomedialog("This is not You",res.msg, context);
          }
      }
      else{
        //dialog
        awesomedialog("Error",res.msg, context);
        // ignore: avoid_print
        print("failed");
      }
    }
  }
  makeTextFeildsEmpty(){
    phoneController.text = "";
    passController.text = "";
  }
  getMenuButton(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(Icons.menu, color: Colors.white, size: 50,),
            Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
