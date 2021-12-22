
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spdycustomers/Model/JsonData/user_credit_card_response.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/prefdata.dart';

import 'edit_credit_card.dart';

class PayAccountSettings extends StatefulWidget {
  const PayAccountSettings({Key? key}) : super(key: key);

  @override
  _PayAccountSettingsState createState() => _PayAccountSettingsState();
}

class _PayAccountSettingsState extends State<PayAccountSettings> {

  Color editColor = Colors.white;
  Color editColor2 = Colors.white;

  Icon crossIcon = Icon(Icons.highlight_off_outlined,color: buttonPressRedColor(),size: 40,);
  Icon tickIcon = Icon(Icons.check_circle_outline_outlined,color: greenColor(),size: 40,);

  @override
  void initState() {
    getCardData();
    super.initState();
  }
  getCardData()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    String? userId = await pref.getString(Data.userId!);
    UserCreditCardResponse? apiServices =await ApiServices.userCreditCards(userId);
    print(apiServices!.userInfo!.cards);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: backgroundColor(),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 25, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account Settings",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.white),
                    height: 180,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.credit_card_outlined,
                                color: buttonPressBlueColor(),
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Default Credit Card",
                                  style: TextStyle(
                                      color: buttonPressBlueColor(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 40, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ending 1234",
                                    style: TextStyle(
                                        color: buttonPressBlueColor(),
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Exp 11/21",
                                    style: TextStyle(
                                        color: buttonPressBlueColor(),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    editColor2 == Colors.white ?
                                    editColor2 = buttonPressBlueColor() :
                                    editColor2 = Colors.white;
                                  });
                                  dialog();

                                },

                                child: Container(
                                  height: 40,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  decoration: BoxDecoration(
                                      color: editColor2,
                                      border: Border.all(
                                          color: buttonPressBlueColor(),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                      child: Text("Delete Credit Card",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: editColor2 ==
                                                  buttonPressBlueColor() ?
                                              Colors.white :
                                              buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    editColor == Colors.white ?
                                    editColor = buttonPressBlueColor() :
                                    editColor = Colors.white;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  decoration: BoxDecoration(
                                      color: editColor,
                                      border: Border.all(
                                          color: buttonPressBlueColor(),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                      child: Text("Edit Credit Card",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: editColor ==
                                                  buttonPressBlueColor() ?
                                              Colors.white :
                                              buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold))),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                 /* Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.white),
                    height: 180,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.credit_card_outlined,
                                color: buttonPressBlueColor(),
                                size: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Default Credit Card",
                                  style: TextStyle(
                                      color: buttonPressBlueColor(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 40, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ending 1234",
                                    style: TextStyle(
                                        color: buttonPressBlueColor(),
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Exp 11/21",
                                    style: TextStyle(
                                        color: buttonPressBlueColor(),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    editColor2 == Colors.white ?
                                    editColor2 = buttonPressBlueColor() :
                                    editColor2 = Colors.white;
                                  });
                                  dialog();

                                },

                                child: Container(
                                  height: 40,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  decoration: BoxDecoration(
                                      color: editColor2,
                                      border: Border.all(
                                          color: buttonPressBlueColor(),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                      child: Text("Delete Credit Card",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: editColor2 ==
                                                  buttonPressBlueColor() ?
                                              Colors.white :
                                              buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    editColor == Colors.white ?
                                    editColor = buttonPressBlueColor() :
                                    editColor = Colors.white;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  decoration: BoxDecoration(
                                      color: editColor,
                                      border: Border.all(
                                          color: buttonPressBlueColor(),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Center(
                                      child: Text("Edit Credit Card",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: editColor ==
                                                  buttonPressBlueColor() ?
                                              Colors.white :
                                              buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold))),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),*/
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: const [
                            Icon(
                              Icons.navigate_before, color: Colors.white, size: 40,),

                          ],
                        ),
                        onPressed: () {
                          // _controller.previousPage(
                          //     duration: _kDuration, curve: _kCurve);
                        },
                      ),
                      const Text("Step 1 of 1",
                        style: TextStyle(fontSize: 15, color: Colors.white),),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Row(
                          children: const [
                            Icon(Icons.navigate_next, color: Colors.white, size: 40,),

                          ],
                        ),
                        onPressed: () {
                          // _controller.nextPage(duration: _kDuration, curve: _kCurve);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditCreditCard()));
                      },
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white),
                        child: Stack(
                          children: [
                            Positioned(
                                right: 20,
                                top: 10,
                                child: editColor == Colors.white? crossIcon : tickIcon
                            ),
                            const Center(
                                child: Text(
                                  "Apple Pay",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                            "Add New Payment",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
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
            ),
          ])),
    );
  }
  void dialog() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            color: Colors.white,
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Are you sure?",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You are not able to delete if this is your only payment method",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: buttonPressRedColor(),
                            border: Border.all(
                                color: buttonPressRedColor(), width: 2)),
                        child: const Center(
                            child: Text(
                              "No, Keep Credit Card",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: greenColor(),
                            border: Border.all(color: greenColor(), width: 2)),
                        child: const Center(
                            child: Text(
                              "Yes, Delete Credit Card",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      context: context,
    );
  }
}
