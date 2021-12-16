import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spdycustomers/dataHandler/update_data.dart';
import 'package:spdycustomers/pages/Order/car_info.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  bool towingCheck = false;
  bool spareCheck = false;
  bool jumeCheck = false;
  bool outGasCheck = false;
  bool newBatteryCheck = false;

  Color cardColor = Colors.white;
  Color cardColor1 = Colors.white;
  Color cardColor2 = Colors.white;
  Color cardColor3 = Colors.white;
  Color cardColor4 = Colors.white;        String? roadside_assistance;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backgroundColor(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 80, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("New Order",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Check all that are applicable.",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  getCards(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    backArrow(),
                    const Text(
                      "Step 1 of 4",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    // ignore: deprecated_member_use
                    forwardArrow(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  backArrow() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        //dialogue
        backAllert();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 60,
          ),
          Text(
            'Back',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }

  forwardArrow() {
    // ignore: deprecated_member_use
    return FlatButton(
      child: Row(
        children: const <Widget>[
          Text(
            'Next',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 60,
          ),
        ],
      ),
      onPressed: () {
        if (towingCheck == false &&
            spareCheck == false &&
            jumeCheck == false &&
            outGasCheck == false &&
            newBatteryCheck == false)
        {
          // ignore: avoid_print
          print("please select at least one of them");
          //dialogue
          dialogue();
          return;
        }
        else{
          if(towingCheck ==true ){
            if(roadside_assistance==null){
            roadside_assistance = "twoing";
            }
            else{
              roadside_assistance = roadside_assistance! + ", twoing";

            };
          }
          if(spareCheck ==true ){
            if(roadside_assistance==null){
              roadside_assistance = "spare tire change";
            }
            else{
              roadside_assistance = roadside_assistance! + ", spare tire change";

            };
          }
          if(jumeCheck ==true ){
            if(roadside_assistance==null){
              roadside_assistance = "jump start";
            }
            else{
              roadside_assistance = roadside_assistance! + ", jump start";
            };
          }
          if(outGasCheck ==true ){
            if(roadside_assistance==null){
              roadside_assistance = "out of gas delivery";
            }
            else{
              roadside_assistance = roadside_assistance! + ", out of gas delivery";

            };
          }
          if(newBatteryCheck ==true ){
            if(roadside_assistance==null){
              roadside_assistance = "new battery install";
            }
            else{
              roadside_assistance = roadside_assistance! + ", new battery install";

            };
          }

          print(roadside_assistance);
        }
        UpdateData().updateCheckApplicable(towingCheck, spareCheck, jumeCheck,
            outGasCheck, newBatteryCheck, roadside_assistance, context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const CarInfo()));
      },
    );
  }

  getCards() {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            tileColor: cardColor,
            leading: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                checkColor: Colors.blue,
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return cardColor == Colors.white
                          ? buttonPressBlueColor()
                          : Colors
                              .white; // the color when checkbox is selected;
                    }
                    return cardColor == Colors.white
                        ? buttonPressBlueColor()
                        : Colors.white; //the color when checkbox is unselected;
                  },
                ),
                value: towingCheck,
                onChanged: (val) {
                  setState(() {
                    towingCheck = val!;
                    if (val == true) {}
                    cardColor == Colors.white
                        ? cardColor = buttonPressBlueColor()
                        : cardColor = Colors.white;
                  });
                },
              ),
            ),
            title: Text("Towing",
                style: TextStyle(
                    fontSize: 18,
                    color: cardColor == buttonPressBlueColor()
                        ? Colors.white
                        : buttonPressBlueColor())),
          ),
        ),
        Card(
          child: ListTile(
            tileColor: cardColor1,
            leading: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                checkColor: Colors.blue,
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return cardColor1 == Colors.white
                          ? buttonPressBlueColor()
                          : Colors
                              .white; // the color when checkbox is selected;
                    }
                    return cardColor1 == Colors.white
                        ? buttonPressBlueColor()
                        : Colors.white; //the color when checkbox is unselected;
                  },
                ),
                value: spareCheck,
                onChanged: (val) {
                  setState(() {
                    spareCheck = val!;
                    if (val == true) {}
                    cardColor1 == Colors.white
                        ? cardColor1 = buttonPressBlueColor()
                        : cardColor1 = Colors.white;
                  });
                },
              ),
            ),
            title: Text("Spare Tire Change",
                style: TextStyle(
                    fontSize: 18,
                    color: cardColor1 == buttonPressBlueColor()
                        ? Colors.white
                        : buttonPressBlueColor())),
          ),
        ),
        Card(
          child: ListTile(
            tileColor: cardColor2,
            leading: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                checkColor: Colors.blue,
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return cardColor2 == Colors.white
                          ? buttonPressBlueColor()
                          : Colors
                              .white; // the color when checkbox is selected;
                    }
                    return cardColor2 == Colors.white
                        ? buttonPressBlueColor()
                        : Colors.white; //the color when checkbox is unselected;
                  },
                ),
                value: jumeCheck,
                onChanged: (val) {
                  setState(() {
                    jumeCheck = val!;
                    if (val == true) {}
                    cardColor2 == Colors.white
                        ? cardColor2 = buttonPressBlueColor()
                        : cardColor2 = Colors.white;
                  });
                },
              ),
            ),
            title: Text("Jump Start",
                style: TextStyle(
                    fontSize: 18,
                    color: cardColor2 == buttonPressBlueColor()
                        ? Colors.white
                        : buttonPressBlueColor())),
          ),
        ),
        Card(
          child: ListTile(
            tileColor: cardColor3,
            leading: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                checkColor: Colors.blue,
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return cardColor3 == Colors.white
                          ? buttonPressBlueColor()
                          : Colors
                              .white; // the color when checkbox is selected;
                    }
                    return cardColor3 == Colors.white
                        ? buttonPressBlueColor()
                        : Colors.white; //the color when checkbox is unselected;
                  },
                ),
                value: outGasCheck,
                onChanged: (val) {
                  setState(() {
                    outGasCheck = val!;
                    if (val == true) {}
                    cardColor3 == Colors.white
                        ? cardColor3 = buttonPressBlueColor()
                        : cardColor3 = Colors.white;
                  });
                },
              ),
            ),
            title: Text("Out of Gas Delivery",
                style: TextStyle(
                    fontSize: 18,
                    color: cardColor3 == buttonPressBlueColor()
                        ? Colors.white
                        : buttonPressBlueColor())),
          ),
        ),
        Card(
          child: ListTile(
            tileColor: cardColor4,
            leading: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                checkColor: Colors.blue,
                fillColor: MaterialStateColor.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return cardColor4 == Colors.white
                          ? buttonPressBlueColor()
                          : Colors
                              .white; // the color when checkbox is selected;
                    }
                    return cardColor4 == Colors.white
                        ? buttonPressBlueColor()
                        : Colors.white; //the color when checkbox is unselected;
                  },
                ),
                value: newBatteryCheck,
                onChanged: (val) {
                  setState(() {
                    newBatteryCheck = val!;
                    if (val == true) {}
                    cardColor4 == Colors.white
                        ? cardColor4 = buttonPressBlueColor()
                        : cardColor4 = Colors.white;
                  });
                },
              ),
            ),
            title: Text("New Battery Install",
                style: TextStyle(
                    fontSize: 18,
                    color: cardColor4 == buttonPressBlueColor()
                        ? Colors.white
                        : buttonPressBlueColor())),
          ),
        ),
      ],
    );
  }

  //dialogue
  dialogue() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      title: 'Error',
      desc: 'Please Select at Least One.....',
      btnOkOnPress: () {
        // Navigator.pop(context);
      },
    )..show();
  }

  backAllert() {
    return AwesomeDialog(
        context: context,
        title: "No Order",
        desc: "You didn't make an order!\nAre You Sure to Exit",
        dialogType: DialogType.WARNING,
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.pop(context);
        }).show();
  }
}
