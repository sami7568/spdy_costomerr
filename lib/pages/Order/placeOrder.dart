import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/orderPay/paymentOption.dart';

class PlaceOrder extends StatefulWidget {

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor(),
        body:
         Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40,top: 70,right: 40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Place Order",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Flatbed Towing",style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                            Text("\$XX.XX",style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("New Battery Install",style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                            Text("\$XX.XX",style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total",style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                            Text("\$XX.XX",style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                          ],
                        ),
                        SizedBox(height: 120,),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentOption()));
                            },
                            child: Container(
                              height: 60,
                              width: 280,
                              child: Center(child: Text("Place Order",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                ),
              ]
        ),
    );
  }
}
