import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/dataHandler/update_data.dart';
import 'package:spdycustomers/global_variables.dart';
import 'package:spdycustomers/pages/AccountSetting/account_settings.dart';
import 'package:spdycustomers/pages/AppSetting/app_settings.dart';
import 'package:spdycustomers/pages/Login/login.dart';
import 'package:spdycustomers/pages/Menu/past_order.dart';
import 'package:spdycustomers/pages/PaymentSetting/payment_setting.dart';
import 'package:spdycustomers/Widgets/colors.dart';

import 'current_no_order.dart';
import 'current_order.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool selected = false;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Stack(
              children: [
                getListview(),
                getCancelButton(),
              ],
            ),
          )),
    );
  }

  getListview(){
    return ListView(
        children: <Widget>[
          getMenuTile("Current Order", 'Check an order that you are doing',const CurrentOrders()),
          getMenuTile("Past Order", "Edit payment method.", const PastOrders()),
          getMenuTile("Payment", 'Check an order that you are doing', const PaymentSetting()),
          getMenuTile("Account Settings", 'Edit your account information.', const AccountSettings()),
          getMenuTile("App Settings", 'Edit your app configurations.',const AppSettings()),
          getMenuTile("Logout", 'Logout of this app', const Login()),
        ]);
  }
  getCancelButton(){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
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
    );
  }
  getMenuTile(String? title, String? desc, Widget? pageDirect){
    return GestureDetector(
      onTap: ()async{
        if(pageDirect == Login()){
          String? userId = Provider.of<AppData>(context,listen:false).uId;
          await ApiServices.signout(userId);

        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => pageDirect!));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: buttonPressBlueColor(),width: 2),
            borderRadius: BorderRadius.circular(4.0)),
        child: ListTile(
          title: Text(title!, style: TextStyle(color: buttonPressBlueColor(), fontWeight: FontWeight.bold)),
          subtitle: Text(desc!, style: TextStyle(color: buttonPressBlueColor())),
        ),
      ),
    );
  }
}
