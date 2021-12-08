import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/pages/Order/carInfo.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {

  bool towingCheck = false;
  bool spareCheck = false;
  bool jumeCheck = false;
  bool outGasCheck = false;
  bool newBatteryCheck = false;
  String _currText="";
  Color _checkColor = Colors.white;
  Color _activeColor = buttonPressBlueColor();

  Color cardColor = Colors.white;
  Color cardColor1 = Colors.white;
  Color cardColor2 = Colors.white;
  Color cardColor3 = Colors.white;
  Color cardColor4 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 80, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Order", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30,),
                    Text("Check all that are applicable.", style: TextStyle(fontSize: 17, color: Colors.white, )),
                    SizedBox(height: 30,),

                    Column(
                        children: [
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
                                        return cardColor == Colors.white? buttonPressBlueColor() :Colors.white; // the color when checkbox is selected;
                                      }
                                      return cardColor == Colors.white? buttonPressBlueColor() :Colors.white; //the color when checkbox is unselected;
                                    },
                                  ),
                                  value: towingCheck,
                                  onChanged: (val) {
                                    setState(() {
                                      towingCheck = val!;
                                      if (val == true) {
                                        _currText = val.toString();
                                      }
                                      cardColor == Colors.white ?
                                          cardColor = buttonPressBlueColor():
                                          cardColor = Colors.white;
                                    });
                                  },
                                ),
                              ),
                              title: Text("Towing", style: TextStyle(fontSize: 18 ,color: cardColor == buttonPressBlueColor()? Colors.white : buttonPressBlueColor())),
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
                                        return cardColor1 == Colors.white? buttonPressBlueColor() :Colors.white; // the color when checkbox is selected;
                                      }
                                      return cardColor1 == Colors.white? buttonPressBlueColor() :Colors.white; //the color when checkbox is unselected;
                                    },
                                  ),
                                  value: spareCheck,
                                  onChanged: (val) {
                                    setState(() {
                                      spareCheck = val!;
                                      if (val == true) {
                                        _currText = val.toString();
                                      }
                                      cardColor1 == Colors.white ?
                                      cardColor1 = buttonPressBlueColor():
                                      cardColor1 = Colors.white;

                                    });
                                  },
                                ),
                              ),
                              title: Text("Spare Tire Change", style: TextStyle(fontSize: 18 ,color: cardColor1 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor())),
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
                                        return cardColor2 == Colors.white? buttonPressBlueColor() :Colors.white; // the color when checkbox is selected;
                                      }
                                      return cardColor2 == Colors.white? buttonPressBlueColor() :Colors.white; //the color when checkbox is unselected;
                                    },
                                  ),
                                  value: jumeCheck,
                                  onChanged: (val) {
                                    setState(() {
                                      jumeCheck = val!;
                                      if (val == true) {
                                        _currText = val.toString();
                                      }
                                      cardColor2 == Colors.white ?
                                      cardColor2 = buttonPressBlueColor():
                                      cardColor2 = Colors.white;

                                    });
                                  },
                                ),
                              ),
                              title: Text("Jump Start", style: TextStyle(fontSize: 18 ,color: cardColor2 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor())),
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
                                        return cardColor3 == Colors.white? buttonPressBlueColor() :Colors.white; // the color when checkbox is selected;
                                      }
                                      return cardColor3 == Colors.white? buttonPressBlueColor() :Colors.white; //the color when checkbox is unselected;
                                    },
                                  ),
                                  value: outGasCheck,
                                  onChanged: (val) {
                                    setState(() {
                                      outGasCheck = val!;
                                      if (val == true) {
                                        _currText = val.toString();
                                      }
                                      cardColor3 == Colors.white ?
                                      cardColor3 = buttonPressBlueColor():
                                      cardColor3 = Colors.white;

                                    });
                                  },
                                ),
                              ),
                              title: Text("Out of Gas Delivery", style: TextStyle(fontSize: 18 ,color: cardColor3 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor())),
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
                                        return cardColor4 == Colors.white? buttonPressBlueColor() :Colors.white; // the color when checkbox is selected;
                                      }
                                      return cardColor4 == Colors.white? buttonPressBlueColor() :Colors.white; //the color when checkbox is unselected;
                                    },
                                  ),
                                  value: newBatteryCheck,
                                  onChanged: (val) {
                                    setState(() {
                                      newBatteryCheck = val!;
                                      if (val == true) {
                                        _currText = val.toString();
                                      }
                                      cardColor4 == Colors.white ?
                                      cardColor4 = buttonPressBlueColor():
                                      cardColor4 = Colors.white;

                                    });
                                  },
                                ),
                              ),
                              title: Text("New Battery Install", style: TextStyle(fontSize: 18 ,color: cardColor4 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor())),
                            ),
                          ),
                        ]
                    ),
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
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Icon(Icons.navigate_before, color: Colors.white, size: 60,),
                            Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),
                          ],
                        ),
                      ),
                      Text("Step 1 of 4", style: TextStyle(fontSize: 15, color: Colors.white),),
                      FlatButton(
                        child: Row(
                          children: [
                            Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
                            Icon(Icons.navigate_next, color: Colors.white, size: 60,),
                          ],
                        ),
                        onPressed: () {
                          if(towingCheck ==false && spareCheck==false && jumeCheck==false && outGasCheck==false && newBatteryCheck==false){
                            print("please select at least one of them");
                            //dialogue
                            dialogue();
                            return;
                          }
                           Navigator.push(context, MaterialPageRoute(builder: (context) => CarInfo(
                             towingCheck: towingCheck,
                             newBatteryCheck: newBatteryCheck,
                             jumeCheck: jumeCheck,
                             outGasCheck: outGasCheck,
                             spareCheck: spareCheck,
                           )));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  //dialogue
  dialogue(){
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
}
