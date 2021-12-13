import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/Map/client_map1.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/pages/Registeration/acc_reg.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key, this.cardName}) : super(key: key);
  final String? cardName;
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  bool _isChecked = false;
  TextEditingController cardNametextEditingController = TextEditingController();
  TextEditingController cardNotextEditingController = TextEditingController();
  TextEditingController cardExpirytextEditingController = TextEditingController();
  TextEditingController cardpintextEditingController = TextEditingController();

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
              getNav(),
            ],
          )),
    );
  }
  getFields (){
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Payment", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20,),
          getInputFields(),

          const SizedBox(height: 10,),
          getCheckBox(),
        ],
      ),
    );
  }
  getInputFields(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Name on Card", style: TextStyle(fontSize: 16, color: Colors.white, )),
        const SizedBox(height: 1,),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                autofocus: true,
                smartDashesType: SmartDashesType.enabled,
                decoration: InputDecoration(hintText: "Type the Name on Credit Card",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                ),
              ),
            )
        ),
        const SizedBox(height: 10,),
        const Text("Credit Card Number", style: TextStyle(fontSize: 16, color: Colors.white, )),
        const SizedBox(height: 1,),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 16,
                decoration: InputDecoration(hintText: "Type the 16-Digit Number",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                ),
              ),
            )
        ),
        const SizedBox(height: 10,),
        const Text("Expiration", style: TextStyle(fontSize: 16, color: Colors.white, )),
        const SizedBox(height: 1,),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                onTap: (){
                  cardExpirytextEditingController.text = "";
                  cardExpirytextEditingController.addListener(() {
                    String text = cardExpirytextEditingController.text;
                    if (text.length == 2) {
                      text += '/';
                    }
                    cardExpirytextEditingController.value = cardExpirytextEditingController.value.copyWith(
                      text: text,
                      selection:
                      TextSelection(baseOffset: text.length, extentOffset: text.length),
                      composing: TextRange.empty,
                    );
                    print(cardExpirytextEditingController.text);
                  });
                  // showDatePicker(
                  //   initialDatePickerMode: DatePickerMode.year,
                  //
                  //   initialEntryMode: DatePickerEntryMode.calendarOnly,
                  //   context: context,
                  //   initialDate: DateTime.now(),
                  //   firstDate: DateTime.now(),
                  //   lastDate: DateTime(2050),
                  // ).then((date) {
                  //   setState(() {
                  //     _date = date!;
                  //     print(date);
                  //   });
                  // });
                },
                maxLength: 5,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: cardExpirytextEditingController,
                decoration: InputDecoration(hintText: "MM/YY",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                ),
              ),
            )
        ),
        const SizedBox(height: 10,),
        const Text("3-Digit/4-Digit Number", style: TextStyle(fontSize: 16, color: Colors.white, )),
        const SizedBox(height: 1,),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                maxLength: 3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "000",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                ),
              ),
            )
        ),
      ],
    );
  }
  getCheckBox(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          checkColor: buttonPressBlueColor(),
          fillColor: MaterialStateColor.resolveWith(
                (states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.white; // the color when checkbox is selected;
              }
              return Colors.white; //the color when checkbox is unselected;
            },
          ),
          value: _isChecked,
          onChanged: (val) {
            setState(() {
              _isChecked = val!;
              if (val == true) {
              }
            });
          },
        ),
        const Text("Save this Credit Card Information", style: TextStyle(fontSize: 15 ,color: Colors.white)),

      ],
    );
  }
  getNav(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ignore: deprecated_member_use
           getBackButton(),
            // ignore: deprecated_member_use
            getForwardButton(),
          ],
        ),
      ),
    );
  }
  getForwardButton(){
    return FlatButton(
      child: Row(
        children: const [
          Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
          Icon(Icons.navigate_next, color: Colors.white, size: 60,),

        ],
      ),
      onPressed: () async {

        String? cardno = cardNotextEditingController.text;
        String? expiry = cardExpirytextEditingController.text;
        String? pin = cardpintextEditingController.text;
        String? name = cardNametextEditingController.text;
        if(cardNametextEditingController.text.isEmpty && cardNotextEditingController.text.isEmpty &&
            cardExpirytextEditingController.text.isEmpty && cardpintextEditingController.text.isEmpty){
          forwardalert("Fields are Empty");
        }
       /* else if(cardno.length <15){
          forwardalert("Card number length is not valid");
        }
        else if(expiry.length<5){
          forwardalert("Please check Expiry Date");
        }
        else if(pin.length<3){
          forwardalert("Card pin is not valid");
        }
        else if(_isChecked){
          // ignore: avoid_print
          print(_isChecked);
        }
       */ else {
          //call api here
          showdialog("please wait", context);
          String? userId = Provider.of<AppData>(context,listen: false).uId;
          String? userName = Provider.of<AppData>(context,listen: false).uName;
          String? cardno = cardNotextEditingController.text;
          String? expiry = cardExpirytextEditingController.text;
          String? pin = cardpintextEditingController.text;

                 await ApiServices.addCreditCard(userId, userName, cardno,expiry,pin );

           Navigator.pop(context);

         // Navigator.push(context, MaterialPageRoute(builder: (context) => const ClientMap1()));
        }
        // _controller.nextPage(duration: _kDuration, curve: _kCurve);
      },
    );
  }
  getBackButton(){
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget> [
          Icon(Icons.navigate_before, color: Colors.white, size: 60,),
          Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),
        ],
      ),
      onPressed: () {
        backalert();
        // _controller.previousPage(
        //     duration: _kDuration, curve: _kCurve);
      },
    );
  }
  forwardalert(String? error){
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      title: 'Error',
      desc: '$error',
      btnOkOnPress: () {
        // Navigator.pop(context);
      },
    ).show();
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


