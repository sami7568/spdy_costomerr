import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/pages/Order/chooseService.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class CarInfo extends StatefulWidget {

  CarInfo({this.towingCheck,this.spareCheck,this.outGasCheck,this.jumeCheck,this.newBatteryCheck,});
  final bool? towingCheck,spareCheck,jumeCheck,outGasCheck,newBatteryCheck;

  @override
  _CarInfoState createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {

  String? _carMakerchosenValue;
  String? _carModelchosenValue;
  String? chooseweight;
  int wdChooseValue=-1;
  Color cardColor = Colors.white;
  Color cardColor1 = Colors.white;
  Color cardColor2 = Colors.white;
  TextEditingController carInfoTextEditingController = TextEditingController();

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
                padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Car Information", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20,),
                    Text("Car Maker", style: TextStyle(fontSize: 17, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        iconEnabledColor: Colors.black,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        underline:SizedBox(),
                        value: _carMakerchosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),

                        items: <String>[
                          'Android',
                          'IOS',
                          'Flutter',
                          'Node',
                          'Java',
                          'Python',
                          'PHP',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select One",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _carMakerchosenValue = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Car Model", style: TextStyle(fontSize: 17, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        iconEnabledColor: Colors.black,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        underline:SizedBox(),
                        value: _carModelchosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),

                        items: <String>[
                          'Android',
                          'IOS',
                          'Flutter',
                          'Node',
                          'Java',
                          'Python',
                          'PHP',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select One",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _carModelchosenValue = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Car year", style: TextStyle(fontSize: 17, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: carInfoTextEditingController,
                          decoration: InputDecoration(
                            hintText: "1900",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                          ),
                        ),
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Row(
                           children: [
                             Radio(
                               value: 1,
                               groupValue: wdChooseValue,
                               onChanged: (int? value) {
                                 setState(() {
                                   wdChooseValue = value!;
                                   //print(widget.val);
                                 });
                               },
                               activeColor: Colors.white,
                               hoverColor: Colors.white,
                             ),
                             Text("4WD", style: TextStyle(color: Colors.white, fontSize: 18),),
                           ],
                         ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: wdChooseValue,
                            onChanged: (int? value) {
                              setState(() {
                                wdChooseValue = value!;
//                  print(widget.val);
                              });
                            },
                            activeColor: Colors.white,
                          ),
                          Text("2WD", style: TextStyle(color: Colors.white, fontSize: 18),),
                        ],
                      ),
                    ],
                    ),
                    SizedBox(height: 5,),
                    widget.towingCheck==true?
                    Container(
                      child: Column(
                        children: [
                            Text("Choose Tow Weight", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(cardColor == Colors.white ){
                                    cardColor = buttonPressBlueColor();
                                    cardColor1 = Colors.white;
                                    cardColor2 = Colors.white;
                                    chooseweight = "Light Weight";
                                  }
                                  else{
                                  cardColor = Colors.white;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 80,
                                decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.circular(5),

                                    border: Border.all(color: buttonPressBlueColor())
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Light Weight", style: TextStyle(color: cardColor == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),),
                                    Text("Sedans, SUVs, Vans, Pick-Up Trucks, Mini-Vans, Motocycles, small trailers.", style: TextStyle(color: cardColor == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(), fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(cardColor1 == Colors.white ){
                                    cardColor1 = buttonPressBlueColor();
                                    cardColor2 = Colors.white;
                                    cardColor = Colors.white;
                                    chooseweight = "Medium Weight";
                                  }
                                  else{
                                  cardColor1 = Colors.white;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 80,
                                decoration: BoxDecoration(
                                    color: cardColor1,
                                    borderRadius: BorderRadius.circular(5),

                                    border: Border.all(color: buttonPressBlueColor())
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Medium Weight", style: TextStyle(color: cardColor1 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),),
                                    Text("Food trucks, Class C Motor Homes, 1-Ton Vehicles, Buses, Shuttles, Utility trucks, Large Ball Hitch Trailers.", style: TextStyle(color: cardColor1 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(), fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if(cardColor2 == Colors.white){
                                    cardColor2 = buttonPressBlueColor();
                                    cardColor = Colors.white;
                                    cardColor1 = Colors.white;
                                    chooseweight = "Heavy Weight";
                                  }
                                  else{
                                  cardColor2 = Colors.white;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 80,
                                decoration: BoxDecoration(
                                    color: cardColor2,
                                    borderRadius: BorderRadius.circular(5),

                                    border: Border.all(color: buttonPressBlueColor())
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Heavy Duty", style: TextStyle(color: cardColor2 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(),fontWeight: FontWeight.bold, fontSize: 20),),
                                    Text("Cement trucks, Cranes, Heavy Equipment transport, Semi, Tractor trailers, Tankers, 5th Wheel trailers.", style: TextStyle(color: cardColor2 == buttonPressBlueColor()? Colors.white : buttonPressBlueColor(), fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                    :Container(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.navigate_before, color: Colors.white, size: 60,),
                            Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),

                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text("Step 2 of 4", style: TextStyle(fontSize: 15, color: Colors.white),),
                      FlatButton(

                        child: Row(
                          children: [
                            Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
                            Icon(Icons.navigate_next, color: Colors.white, size: 60,),
                          ],
                        ),
                        onPressed: () {
                          //check all fields are selected
                          if(_carMakerchosenValue==null || _carModelchosenValue==null || carInfoTextEditingController.text.isEmpty ||wdChooseValue==-1){
                            print("please check what you missed");
                            //dialogue
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              title: 'Error',
                              desc: 'Please check all fields.....',
                              btnOkOnPress: () {
                                // Navigator.pop(context);
                              },
                            )..show();
                            return;
                          }
                          if(widget.towingCheck==true){
                            if(cardColor == Colors.white && cardColor1 == Colors.white && cardColor2 == Colors.white){
                              print("please choose two weight");
                              //dialogue
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.WARNING,
                                title: 'Error',
                                desc: 'Please choose two weight.....',
                                btnOkOnPress: () {
                                  // Navigator.pop(context);
                                },
                              )..show();
                              return;
                            }
                          }

                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseService(
                            carMakerchosenValue: _carMakerchosenValue,
                            carModelchosenValue: _carModelchosenValue,
                            caryear: carInfoTextEditingController.text,
                            wdChooseValue: wdChooseValue,
                            selectedWeight: chooseweight,
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
}
