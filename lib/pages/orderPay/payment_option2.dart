import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class PaymentOptions2 extends StatefulWidget {
  const PaymentOptions2({Key? key}) : super(key: key);



  @override
  _PaymentOptions2State createState() => _PaymentOptions2State();
}

class _PaymentOptions2State extends State<PaymentOptions2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(

              children: [
                const Positioned(
                    left: 30,
                    top: 70,
                    child: Text("Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Container(

                        height: 60,
                        width: 280,
                        child: const Center(child: Text("Credit Card",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold), )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: buttonPressBlueColor()

                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(

                        height: 60,
                        width: 280,
                        child: const Center(child: Text("Google Pay",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold), )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white

                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(

                        height: 60,
                        width: 280,
                        child: const Center(child: Text("Paypal",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white

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
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Row(

                          children: const [
                            Icon(Icons.navigate_before, color: Colors.white, size: 60,),
                            Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),

                          ],
                        ),
                        onPressed: () {
                          // _controller.previousPage(
                          //     duration: _kDuration, curve: _kCurve);
                        },
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Row(
                          children:const [
                            Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
                             Icon(Icons.navigate_next, color: Colors.white, size: 60,),

                          ],
                        ),
                        onPressed: () {
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
