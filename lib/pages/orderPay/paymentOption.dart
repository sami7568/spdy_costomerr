import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/orderPay/paymentDetails.dart';

class PaymentOption extends StatefulWidget {
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {

  Color cardColor = Colors.white;
  Color cardColor1 = Colors.white;
  Color cardColor2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(

          children: [
            Positioned(
                left: 30,
                top: 70,
                child: Text("Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cardColor == Colors.white ?
                      cardColor = buttonPressBlueColor():
                      cardColor = Colors.white;
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
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cardColor1 == Colors.white ?
                      cardColor1 = buttonPressBlueColor():
                      cardColor1 = Colors.white;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetails()));
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
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cardColor2 == Colors.white ?
                      cardColor2 = buttonPressBlueColor():
                      cardColor2 = Colors.white;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetails()));
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
            ),
            Align(
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
                      // _controller.previousPage(
                      //     duration: _kDuration, curve: _kCurve);
                    },
                  ),
                  FlatButton(
                    child: Row(
                      children: [
                        Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
                        Icon(Icons.navigate_next, color: Colors.white, size: 60,),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetails()));
                      // _controller.nextPage(duration: _kDuration, curve: _kCurve);
                    },
                  )
                ],
              ),
            )
        ]
        ),
      )
    );
  }
}
