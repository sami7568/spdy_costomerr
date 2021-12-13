import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/pages/orderPay/payment_option.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}
List<String>  orderList=[];

class _PlaceOrderState extends State<PlaceOrder> {
  
  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: Stack(children: [
        getlist(),
       getCrossButton(),
      ]),
    );
  }

  getItems() {
    return ListView.builder(
        itemCount: orderList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context,int index){
          return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                        orderList[index].toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                    const Text("\$XX.XX",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ]);
        });
  }

  placeOrderButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PaymentOption()));
        },
        child: Container(
          height: 60,
          width: 280,
          child: const Center(
              child: Text("Place Order",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
        ),
      ),
    );
  }
  getTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Total",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Text("\$XX.XX",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
      ],
    );
  }

  getlist(){
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 70, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Place Order",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          getItems(),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 2,
            decoration: const BoxDecoration(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          getTotal(),
          const SizedBox(
            height: 120,
          ),
          placeOrderButton(),
        ],
      ),
    );
  }
  getCrossButton() {
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
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
    );
  }
}
