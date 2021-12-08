import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Menu/onlineNearby.dart';

class EditCellNo extends StatefulWidget {

  @override
  _EditCellNoState createState() => _EditCellNoState();
}

class _EditCellNoState extends State<EditCellNo> {

  TextEditingController oldPhoneEditingController = new TextEditingController();
  TextEditingController newPhoneEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child:
          Padding(
            padding: const EdgeInsets.only(top: 90, bottom: 20, right: 35, left: 35),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Setting", style: TextStyle(fontSize: 30, color: Colors.white),),

                    SizedBox(height: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Old Cell Phone Number", style: TextStyle(fontSize: 15, color: Colors.white),),
                        TextFormField(
                          controller: oldPhoneEditingController,

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Old Number",
                              labelStyle: TextStyle(fontSize: 14.0),
                              hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.0)),

                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 20,),

                        Text("New Cell Phone Number", style: TextStyle(fontSize: 15, color: Colors.white),),
                        TextFormField(
                          controller: newPhoneEditingController,

                          keyboardType: TextInputType.number,
                          // validator:
                          // Validators.compose([
                          //   Validators.required('Password is required'),
                          //   Validators.patternString(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$', 'Invalid Password')
                          // ]),
                          decoration: InputDecoration(

                            focusColor: Colors.black,
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "New Number",
                            labelStyle: TextStyle(fontSize: 14.0),
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),

                          style: TextStyle(fontSize: 14.0),
                        ),

                      ],
                    ),
                    SizedBox(height: 70,),

                    (oldPhoneEditingController.text.isEmpty || newPhoneEditingController.text.isEmpty) ?


                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: Container(
                          width: 280,
                          height: 60,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white
                          ),
                          child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      ),
                    ) : Center(
                      child: Container(
                        width: 280,
                        height: 60,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: buttonPressBlueColor()
                        ),
                        child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),




                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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

              ],
            ),
          )),


    );
  }
}
