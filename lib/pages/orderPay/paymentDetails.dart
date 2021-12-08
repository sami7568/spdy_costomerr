import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/Map/clientMap1.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class PaymentDetails extends StatefulWidget {


  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {

  bool _isChecked = false;
  String _currText = '';


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
                    Text("Payment", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20,),
                    Text("Name on Card", style: TextStyle(fontSize: 16, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Type the Name on Credit Card",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    Text("Credit Card Number", style: TextStyle(fontSize: 16, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            decoration: InputDecoration(hintText: "Type the 16-Digit Number",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    Text("Expiration", style: TextStyle(fontSize: 16, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            decoration: InputDecoration(hintText: "MM/YY",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    Text("3-Digit/4-Digit Number", style: TextStyle(fontSize: 16, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            decoration: InputDecoration(hintText: "000",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    Row(
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
                            _currText = val.toString();
                          }
                        });
                      },
                    ),

                         Text("Save this Credit Card Information", style: TextStyle(fontSize: 15 ,)),

                      ],
                    )


                  ],
                ),
              ),




              Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientMap_1()));

                          // _controller.nextPage(duration: _kDuration, curve: _kCurve);
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


