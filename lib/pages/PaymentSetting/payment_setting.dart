import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spdycustomers/pages/PaymentSetting/pay_account_settings.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class PaymentSetting extends StatefulWidget {
  const PaymentSetting({Key? key}) : super(key: key);


  @override
  _PaymentSettingState createState() => _PaymentSettingState();
}

class _PaymentSettingState extends State<PaymentSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child:
          Stack(
            children: [
              Padding(
              padding: const EdgeInsets.only(top: 80, right: 35, left: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Payment Settings", style: TextStyle(fontSize: 24, color: Colors.white , fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15,),
                  const Text("For security purposes, we require password to access your Account Settings.", style: TextStyle(fontSize: 18, color: Colors.white),),


                  const SizedBox(height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Email or Phone Number", style: TextStyle(fontSize: 15, color: Colors.white),),
                      TextField(

                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "ted@car.com",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15.0)),

                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                      SizedBox(height: 20,),

                      Text("Password", style: TextStyle(fontSize: 15, color: Colors.white),),
                      TextField(
                        obscureText: true,

                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            focusColor: Colors.black,
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "********",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0)),

                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100,),


                  Center(
                    child: GestureDetector(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PayAccountSettings()));

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
                  ),




                ],
              ),
            ),
              Padding(
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
              ),
            ]
          )),


    );
  }
}
