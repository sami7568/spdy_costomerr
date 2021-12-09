import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/pages/Order/location_info.dart';
import 'package:spdycustomers/Widgets/colors.dart';

// ignore: must_be_immutable
class ChooseService extends StatefulWidget {

  String? carMakerchosenValue;
  String? carModelchosenValue;
  String? caryear;
  int? wdChooseValue;
  String? selectedWeight;

  ChooseService({Key? key, this.carModelchosenValue,this.carMakerchosenValue,this.caryear,this.wdChooseValue,this.selectedWeight}) : super(key: key);
  @override
  _ChooseServiceState createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {

  Color cardColor = Colors.white;
  Color cardColor1 = Colors.white;
  Color cardColor2 = Colors.white;
  String? selectedTowingService;

  @override
  void initState() {
    // ignore: avoid_print
    print(widget.selectedWeight);
    super.initState();
  }

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
                padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Choose Towing Service", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(cardColor == Colors.white){
                            cardColor = buttonPressBlueColor();
                            cardColor1 = Colors.white;
                            cardColor2=Colors.white;
                            selectedTowingService = "Wheel Lift";
                          }
                          else{
                          cardColor = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: 120,
                        decoration: BoxDecoration(
                          color: cardColor,
                            borderRadius: BorderRadius.circular(5),

                            border: Border.all(color: buttonPressBlueColor())
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Wheel Lift", style: TextStyle(color: cardColor == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),),
                                Text("\$XX.XX", style: TextStyle(color: cardColor == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),)
                              ],
                            ),
                            Text("Hydraulic boom with cross bars at the end, which slipped under the front or rear wheels of a car. Vehicle is lifted and keeps two wheels on the ground.", style: TextStyle(color: cardColor == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(), fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(cardColor1 == Colors.white){
                            cardColor1 = buttonPressBlueColor();
                            cardColor = Colors.white;
                            cardColor2 = Colors.white;
                            selectedTowingService = "Hook and Chain";
                          }
                          else{
                          cardColor1 = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: 120,
                        decoration: BoxDecoration(
                            color: cardColor1,
                            border: Border.all(color: buttonPressBlueColor()),
                            borderRadius: BorderRadius.circular(5)

                      ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Hook & Chain", style: TextStyle(color: cardColor1 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),),
                                Text("\$XX.XX", style: TextStyle(color: cardColor1 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),)
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: orangeColor(),

                                  borderRadius: BorderRadius.circular(2)
                              ),
                              child: const Text("2WD Only", style: TextStyle(color: Colors.black, fontSize: 11),),
                            ),
                            Text("Recommended for highly damaged car in accident or pulling stuck vehicles.", style: TextStyle(color: cardColor1 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(), fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(cardColor2 == Colors.white ){
                            cardColor2 = buttonPressBlueColor();
                            cardColor = Colors.white;
                            cardColor1 = Colors.white;
                            selectedTowingService = "Flatbed";

                          }
                          else{
                          cardColor2 = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: 120,
                        decoration: BoxDecoration(
                            color: cardColor2,
                            border: Border.all(color: buttonPressBlueColor()),
                            borderRadius: BorderRadius.circular(5)

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Flatbed", style: TextStyle(color: cardColor2 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),),
                                Text("\$XX.XX", style: TextStyle(color: cardColor2 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),)
                              ],
                            ),
                            Container(
                              // ignore: prefer_const_constructors
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: orangeColor(),

                                  borderRadius: BorderRadius.circular(2)
                              ),
                              child:const Text("Light Towing Only", style: TextStyle(color: Colors.black, fontSize: 11),),
                            ),
                            Text("Entire vehicle lifted to the back of a truck. Great for high value cars.", style: TextStyle(color: cardColor2 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(), fontSize: 12)),
                          ],
                        ),
                      ),
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
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: const [
                            Icon(Icons.navigate_before, color: Colors.white, size: 60,),
                            Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),

                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text("Step 3 of 4", style: TextStyle(fontSize: 15, color: Colors.white),),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Row(
                          children: const [
                            Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
                            Icon(Icons.navigate_next, color: Colors.white, size: 60,),

                          ],
                        ),
                        onPressed: () {

                          //check it
                          if(cardColor == Colors.white && cardColor1 == Colors.white && cardColor2 == Colors.white){
                            // ignore: avoid_print
                            print("please choose twoing service");
                            //dialogue
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              title: 'Error',
                              desc: 'Please choose twoing service.....',
                              btnOkOnPress: () {
                                // Navigator.pop(context);
                              },
                            ).show();
                            return;
                          }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LocationInfo(twoingService: selectedTowingService,)));
                          }
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
}
