// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Menu/onlineNearby.dart';
import 'package:spdycustomers/pages/Ratings/why.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double starCounter = 0;
  Color submitcolor = buttonUnPressColor();
  Color submittextcolor = textblackColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:  backgroundColor(),
          child:
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20, right: 15, left: 15),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rate Order", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Container(
                      height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Order #ABC-123",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5,),
                              Text("Nancy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(height: 5,),
                              Text("Request: Light Towing, Battery Replacement"),
                            ],
                          ),
                        ),
                    ),
                    SizedBox(height: 140,),
                    Center(
                      child: SmoothStarRating(
                        rating: starCounter,
                        color: Colors.white,
                        borderColor: Colors.white,
                        allowHalfRating: false,
                        starCount: 5,
                        spacing: 4.0,
                        size: 60,
                        onRated: (value){
                              if(value==0) {
                                setState(() {
                                submitcolor = buttonUnPressColor();
                                submittextcolor = textblackColor();
                                });
                              }
                          starCounter = value;
                          if(starCounter==1){
                            setState(() {
                              submitcolor = buttonPressColor();
                              submittextcolor = textWhiteColor();
                           //   title="Very Bad";
                            });
                          }
                        if(starCounter==2){
                            setState(() {
                              submitcolor = buttonPressColor();
                              submittextcolor = textWhiteColor();
                            //  title="Bad";
                            });
                          }
                          if(starCounter==3){
                            setState(() {
                              submitcolor = buttonPressColor();
                              submittextcolor = textWhiteColor();
                              //title="Good";
                            });
                          }
                          if(starCounter==4){
                            setState(() {
                              submitcolor = buttonPressColor();
                              submittextcolor = textWhiteColor();
                              //title="Very Good";
                            });
                          }
                          if(starCounter==5){
                            setState(() {
                              submitcolor = buttonPressColor();
                              submittextcolor = textWhiteColor();
                             // title="Excellent";
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(height:100),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          starCounter<=3?
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TellUsWhy()))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Container(
                          width: 280,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: submitcolor,
                          ),
                          child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: submittextcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 70,),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.menu, color: Colors.white, size: 50,),
                      Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
