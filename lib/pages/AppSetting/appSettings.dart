import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spdycustomers/Widgets/colors.dart';

import 'mapsettings.dart';
import 'notification.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35, bottom: 40),
                    child: Text(
                      "App Settings",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        fontWeight: FontWeight.bold
                          ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSetting()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Notification",
                              style: TextStyle(
                                  color: buttonPressBlueColor(),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Make changes to your Notification Settings.",
                              style: TextStyle(
                                color: buttonPressBlueColor(),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: 70,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MapSettings()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Set Default Map",
                              style: TextStyle(
                                  color: buttonPressBlueColor(),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Default Map: SPDY",
                              style: TextStyle(
                                color: buttonPressBlueColor(),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      height: 70,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 390,
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
            ),
          )),
    );
  }
}
