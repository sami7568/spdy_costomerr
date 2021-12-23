import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/orderPay/payment_details.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({Key? key}) : super(key: key);

  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {

  Color cardColor = Colors.white;
  Color cardColor1 = Colors.white;
  Color cardColor2 = Colors.white;
  String? cardType;
  @override
  Widget build(BuildContext context) {
    return body();
  }
  body(){
    return  Scaffold(
        backgroundColor: backgroundColor(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
              children: [
                const Positioned(
                    left: 30,
                    top: 70,
                    child: Text("Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25))),
                getPayOptions(),
                getNav(),
              ]
          ),
        )
    );
  }
  getPayOptions(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                cardColor == Colors.white ?
                cardColor = buttonPressBlueColor():
                cardColor = Colors.white;
                cardColor1 = Colors.white;
                cardColor2 = Colors.white;
              });
            },
            child: Container(

              height: 60,
              width: 280,
              child: Center(child: Text("Credit Card",style: TextStyle(color: cardColor == buttonPressBlueColor()? Colors.white : Colors.black,fontSize: 20, fontWeight: FontWeight.bold), )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: cardColor,

              ),
            ),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              setState(() {
                cardColor1 == Colors.white ?
                cardColor1 = buttonPressBlueColor():
                cardColor1 = Colors.white;

                cardColor = Colors.white;
                cardColor2 = Colors.white;
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentDetails()));
            },
            child: Container(

              height: 60,
              width: 280,
              child: Center(child: Text("Apple Pay",style: TextStyle(color: cardColor1 == buttonPressBlueColor()? Colors.white : Colors.black,fontSize: 20, fontWeight: FontWeight.bold), )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: cardColor1

              ),
            ),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              setState(() {
                cardColor2 == Colors.white ?
                cardColor2 = buttonPressBlueColor():
                cardColor2 = Colors.white;

                cardColor = Colors.white;
                cardColor1 = Colors.white;
              });
              //Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentDetails()));
            },
            child: Container(

              height: 60,
              width: 280,
              child: Center(child: Text("Paypal",style: TextStyle(color: cardColor2 == buttonPressBlueColor()? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: cardColor2
              ),
            ),
          )
        ],
      ),
    );
  }
  getNav(){
    return Align(
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
    );
  }
  getBackButton(){
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
        // _controller.previousPage(
        //     duration: _kDuration, curve: _kCurve);
      },
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
      onPressed: () {

        if(cardColor1 == Colors.white && cardColor == Colors.white && cardColor2 == Colors.white)
          {

            // ignore: avoid_print
            print("please select one");
            forwardalert();
            return;
          }
        else {
          if(cardColor !=Colors.white )
          {
            setState(() {
              cardType = "Credit Card";
            });
          }
          if(cardColor !=Colors.white){
            setState(() {
              cardType = "Apple Pay";
            });
          }
          if(cardColor !=Colors.white){
            setState(() {
              cardType = "Paypal";
            });
          }
          //save card
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaymentDetails(nameOnCard: cardType,)));
        }
        // _controller.nextPage(duration: _kDuration, curve: _kCurve);
      },
    );
  }
  forwardalert(){
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      title: 'Error',
      desc: 'Please choose twoing service.....',
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
