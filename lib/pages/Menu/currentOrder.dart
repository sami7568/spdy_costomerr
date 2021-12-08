import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spdycustomers/Widgets/button.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class CurrentOrders extends StatefulWidget {
  @override
  _CurrentOrdersState createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  bool _hasBeenPressed = false;

  Color backColorcanle = Colors.white;
  Color canceltextColor = buttonPressBlueColor();

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 80, right: 30),
                child: Stack(
                  children: [
                    Text("Current Orders",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 300,
                        width: 400,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Order #123-ABC",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("ABC Towning",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        "Request: Light Towing, New Battery Install",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ))),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Someone will see you in:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: orangeColor(),
                                          ),
                                          height: 30,
                                          width: 90,
                                          child: Center(
                                              child: Text(
                                            "15:55",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: greenColor(), width: 2)),
                                      child: Center(
                                          child: Text(
                                        "Contact Provider",
                                        style: TextStyle(
                                            color: greenColor(),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color: buttonPressPurpleColor(),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Show Map",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                                top: 0, right: 0, child: Icon(Icons.more_vert)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
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
                  )),
            ],
          )),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            // color: Colors.green,
            height: 113,
            child: Column(
              children: <Widget>[
                ListTile(
                  tileColor: backColorcanle,
                    title: Center(
                        child: Text("Contact Support",
                            style: TextStyle(
                                color: canceltextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))),
                    onTap: () {
                      // setState(() {
                      //   backColorcanle = buttonPressBlueColor();
                      //   canceltextColor = Colors.white;
                      // });
                      textDialog();
                    }),
                Container(height: 1, color: Colors.grey[300]),
                ListTile(
                  tileColor: backColorcanle,
                  title: Center(
                      child: Text("Cancel Order",
                          style: TextStyle(
                              color: canceltextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))),
                  onTap: () {
                    print("clicked");
                    // setState(() {
                    //   backColorcanle = buttonPressBlueColor();
                    //   canceltextColor = Colors.white;
                    // });

                    dialog();
                  },
                ),
              ],
            ),
          );
        });
  }

  void dialog() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Are you sure?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "There will be penalty charges",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: buttonPressRedColor(),
                            border: Border.all(
                                color: buttonPressRedColor(), width: 2)),
                        child: Center(
                            child: Text(
                          "No, Keep my Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: greenColor(),
                            border: Border.all(color: greenColor(), width: 2)),
                        child: Center(
                            child: Text(
                          "Yes, Cancel Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }

  void textDialog() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
            ),
            height: 380,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Please write your concerns below",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 40, bottom: 60),
                  child: Container(
                    child: Column(
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type Here...',
                              hintStyle:
                              TextStyle(color: Colors.grey),
                              contentPadding:
                              EdgeInsets.only(left: 10)),

                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.grey)),

                    // width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 10, right: 10),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(50.0),
                              color: buttonPressBlueColor(),
                              border: Border.all(
                                  color: buttonPressBlueColor(),
                                  width: 2)),
                          child: Center(
                              child: Text(
                                "Send to Support",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(Icons.cancel_outlined, size: 18,))
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }
}
