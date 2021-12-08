import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/AccountSetting/passwordChange.dart';

import 'editCelNo.dart';
import 'editEmail.dart';

class EditSetting extends StatefulWidget {
  @override
  _EditSettingState createState() => _EditSettingState();
}

class _EditSettingState extends State<EditSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 80, bottom: 20, right: 35, left: 35),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account Settings",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditCellNo()));
                        },
                        child: Container(
                          width: 280,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            "Edit Cell Phone #",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditEmail()));
                        },
                        child: Container(
                          width: 280,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            "Edit Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordChange()));
                        },
                        child: Container(
                          width: 280,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: buttonPressBlueColor()),
                          child: Center(
                              child: Text(
                            "Edit Password",
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Menu",
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
}
