import 'package:flutter/material.dart';
import 'package:spdycustomers/pages/AccountSetting/accountSettings.dart';
import 'package:spdycustomers/pages/AppSetting/appSettings.dart';
import 'package:spdycustomers/pages/Menu/pastOrder.dart';
import 'package:spdycustomers/pages/PaymentSetting/paymentSetting.dart';
import 'package:spdycustomers/Widgets/colors.dart';

import 'currentOrder.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Stack(
              children: [
                ListView(children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentOrders()));
                    },
                    child: Card(
                       shape: RoundedRectangleBorder(
                       side: BorderSide(color: buttonPressBlueColor(),width: 2),
                       borderRadius: BorderRadius.circular(4.0)),
                      child: ListTile(
                        title: Text("Current Order", style: TextStyle(color: buttonPressBlueColor(), fontWeight: FontWeight.bold)),
                        subtitle: Text('Check an order that you are doing', style: TextStyle(color: buttonPressBlueColor())),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PastOrders()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: buttonPressBlueColor(),width: 2),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: ListTile(
                        title: Text('Past Order', style: TextStyle(color: buttonPressBlueColor(),fontWeight: FontWeight.bold)),
                        subtitle: Text("Check previously order completed.", style: TextStyle(color: buttonPressBlueColor())),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSetting()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: buttonPressBlueColor(),width: 2),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: ListTile(
                        title: Text('Payment', style: TextStyle(color: buttonPressBlueColor(),fontWeight: FontWeight.bold)),
                        subtitle: Text("Edit payment method.", style: TextStyle(color: buttonPressBlueColor())),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSetting()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: buttonPressBlueColor(),width: 2),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: ListTile(
                        title: Text('Account Settings', style: TextStyle(color: buttonPressBlueColor(),fontWeight: FontWeight.bold)),
                        subtitle: Text("Edit your account information.", style: TextStyle(color: buttonPressBlueColor())),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AppSettings()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: buttonPressBlueColor(),width: 2),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: ListTile(
                        title: Text('App Settings', style: TextStyle(color: buttonPressBlueColor(),fontWeight: FontWeight.bold)),
                        subtitle: Text("Edit your app configurations.", style: TextStyle(color: buttonPressBlueColor())),
                      ),
                    ),
                  ),
                ]),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
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
                          "Close",
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
          )),
    );
  }
}
