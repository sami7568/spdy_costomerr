import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class EditCreditCard extends StatefulWidget {


  @override
  _EditCreditCardState createState() => _EditCreditCardState();
}

class _EditCreditCardState extends State<EditCreditCard> {

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();


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
                    Text("Edit Credit Card", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
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
                            controller: textEditingController1,
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
                            controller: textEditingController2,
                            decoration: InputDecoration(hintText: "Type the 16-Digit Number",hintStyle: TextStyle(color: Colors.grey[500],), border:InputBorder.none,
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
                            controller: textEditingController3,
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
                            controller: textEditingController4,
                            decoration: InputDecoration(hintText: "000",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 40,),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 270,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white),
                          child: const Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    (textEditingController1.text.isEmpty && textEditingController2.text.isEmpty && textEditingController3.text.isEmpty && textEditingController4.text.isEmpty)
                        ? Center(
                      child: Container(
                        width: 270,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white),
                        child: const Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ) : Center(
                      child: Container(
                        width: 270,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: buttonPressBlueColor()),
                        child: const Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    )

                  ],
                ),
              ),




              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        "Menu",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

