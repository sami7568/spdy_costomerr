import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/dataHandler/update_data.dart';
import 'package:spdycustomers/pages/Order/choose_service.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Order/location_info.dart';

class CarInfo extends StatefulWidget {

   const CarInfo({Key? key,}) : super(key: key);

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

    return body();
  }

  body(){
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Stack(
            children: [
             getFields(),
              getNavi(),
            ],
          )),
    );
  }
  getFields(){
    return  Padding(
      padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Car Information", style:
          TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20,),
          const Text("Car Maker", style: TextStyle(fontSize: 17, color: Colors.white, )),
          const SizedBox(height: 1,),
          getCarMaker(),
          const SizedBox(height: 5,),
          const Text("Car Model", style: TextStyle(fontSize: 17, color: Colors.white, )),
          const SizedBox(height: 1,),
          getCarModel(),
          const SizedBox(height: 5,),
          const Text("Car year", style: TextStyle(fontSize: 17, color: Colors.white, )),
          const SizedBox(height: 1,),
          getCarYear(),
          getDtype(),
          const SizedBox(height: 5,),
          Provider.of<AppData>(context,listen: false).towingCheck==true? getWeightType() :Container(),
        ],
      ),
    );
  }
  getDtype(){
    return Row(
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
            const Text("4WD", style: TextStyle(color: Colors.white, fontSize: 18),),
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
            const Text("2WD", style: TextStyle(color: Colors.white, fontSize: 18),),
          ],
        ),
      ],
    );
  }
  getWeightType(){
    return Column(
      children: [
        const Text("Choose Tow Weight", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10,),
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
            padding: const EdgeInsets.all(10),
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
        const SizedBox(height: 5,),
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
            padding: const EdgeInsets.all(10),
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
        const SizedBox(height: 5,),
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
            padding: const EdgeInsets.all(10),
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
    );
  }
  getCarYear(){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: carInfoTextEditingController,
            decoration: InputDecoration(
              hintText: "1900",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
            ),
          ),
        )
    );
  }
  getCarModel(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<String>(
        iconEnabledColor: Colors.black,
        dropdownColor: Colors.white,
        isExpanded: true,
        underline:const SizedBox(),
        value: _carModelchosenValue,
        //elevation: 5,
        style: const TextStyle(color: Colors.black),

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
    );
  }
  getCarMaker(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<String>(
        iconEnabledColor: Colors.black,
        dropdownColor: Colors.white,
        isExpanded: true,
        underline:const SizedBox(),
        value: _carMakerchosenValue,
        //elevation: 5,
        style: const TextStyle(color: Colors.black),

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
    );
  }
  getNavi(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ignore: deprecated_member_use
            getBackButton(),
            const Text("Step 2 of 4", style: TextStyle(fontSize: 15, color: Colors.white),),
            // ignore: deprecated_member_use
            getForwardButton(),
          ],
        ),
      ),
    );
  }
  getForwardButton(){
    // ignore: deprecated_member_use
    return FlatButton(
      child: Row(
        children: const [
          Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
          Icon(Icons.navigate_next, color: Colors.white, size: 60,),
        ],
      ),
      onPressed: () {
        bool? twingcheck = Provider.of<AppData>(context,listen: false).towingCheck==true;
        //check all fields are selected
        if(_carMakerchosenValue==null || _carModelchosenValue==null || carInfoTextEditingController.text.isEmpty ||wdChooseValue==-1){
          // ignore: avoid_print
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
          ).show();
          return;
        }
        if(twingcheck){
          if(cardColor == Colors.white && cardColor1 == Colors.white && cardColor2 == Colors.white){
            // ignore: avoid_print
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
            ).show();
            return;
          }
        }

        UpdateData().updateCarInfo(_carMakerchosenValue, _carModelchosenValue, chooseweight,carInfoTextEditingController.text, wdChooseValue, context);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>twingcheck? const ChooseService():const LocationInfo()));
      },

    );
  }
  getBackButton(){
    // ignore: deprecated_member_use
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(Icons.navigate_before, color: Colors.white, size: 60,),
          Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),
        ],
      ),
      onPressed: () {
        backalert();
       // Navigator.pop(context);
      },
    );
  }
  backalert(){
    return  AwesomeDialog(
        context: context,
        title: "Warning",
        desc: "Are You Sure You want to go back",
        dialogType: DialogType.WARNING,
        btnCancelOnPress: (){},
        btnOkOnPress: (){
          Navigator.pop(context);
        }
    ).show();
  }
}
