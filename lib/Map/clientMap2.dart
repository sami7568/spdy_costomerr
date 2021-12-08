import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spdycustomers/Widgets/colors.dart';

import 'clientMap4.dart';
class ClientMap_2 extends StatefulWidget {

  @override
  _ClientMap_2State createState() => _ClientMap_2State();
}

class _ClientMap_2State extends State<ClientMap_2> {

  Color confirmColor = Colors.white;

  Color backColorcanle = Colors.white;
  Color canceltextColor = buttonPressBlueColor();

  @override
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  late Position currentPosition;
  var geolocator = Geolocator();
  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude,position.longitude);

    CameraPosition cameraPosition = CameraPosition(target: latLatPosition, zoom: 14);
     newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));


  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,


      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              newGoogleMapController = controller;

              locatePosition();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 170,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order #123-ABC", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Icon(Icons.more_vert)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("ABC Towning", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                  SizedBox(height: 10,),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Light Towing, Flatbed, New Battery Install", style: TextStyle(fontSize: 15, ))),
                  Padding(
                    padding: const EdgeInsets.only(top:20, left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 35,

                      decoration: BoxDecoration(

                          borderRadius:
                          BorderRadius.circular(50.0),
                          color: Colors.white,
                          border: Border.all(
                              color: greenColor(),
                              width: 2)),
                      child: Center(
                          child: Text(
                            "Contact Provider",
                            style: TextStyle(
                                color: greenColor(),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    ),
                  ),
                ],
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: orangeColor()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Terry",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            "will arrive in",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                confirmColor == Colors.white ?
                                confirmColor = buttonPressBlueColor() :
                                confirmColor = Colors.white;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ClientMap_4()));
                            }, child: Text("confirm", style: TextStyle(color: confirmColor ==
                              buttonPressBlueColor() ?
                          Colors.white :
                          buttonPressBlueColor(), fontWeight: FontWeight.bold),),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: confirmColor,
                              shape: StadiumBorder(),
                              side: BorderSide(width: 2.0, color: buttonPressBlueColor()),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.menu,
                            color: buttonPressBlueColor(),
                            size: 50,
                          ),
                          Text(
                            "Menu",
                            style: TextStyle(
                                color: buttonPressBlueColor(),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Hamburger Button for drawer
        ],
      ),

    );
  }

  void dialog() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Are you sure?",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "There will be penalty charges",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: buttonPressRedColor(),
                            border: Border.all(
                                color: buttonPressRedColor(), width: 2)),
                        child: Center(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                "No, Keep my Order",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: greenColor(),
                            border: Border.all(color: greenColor(), width: 2)),
                        child: Center(
                            child: Text(
                              "Yes, Cancel Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            // color: Colors.green,
            height: 113,
            child: Column(
              children: <Widget>[
                ListTile(
                    tileColor: backColorcanle,
                    title: Center(
                        child: Text("Contact Support",
                            style: TextStyle(
                                color: canceltextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))),
                    onTap: () {
                      // setState(() {
                      //   backColorcanle = buttonPressBlueColor();
                      //   canceltextColor = Colors.white;
                      // });
                      textDialog();
                    }),
                Container(height: 1, color: Colors.grey[300]),
                ListTile(
                  tileColor: backColorcanle,
                  title: Center(
                      child: Text("Cancel Order",
                          style: TextStyle(
                              color: canceltextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))),
                  onTap: () {
                    // setState(() {
                    //   backColorcanle = buttonPressBlueColor();
                    //   canceltextColor = Colors.white;
                    // });

                    dialog();
                  },
                ),
              ],
            ),
          );
        });
  }

  void textDialog() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
            ),
            height: 380,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Please write your concerns below",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 40, bottom: 60),
                  child: Container(
                    child: Column(
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type Here...',
                              hintStyle:
                              TextStyle(color: Colors.grey),
                              contentPadding:
                              EdgeInsets.only(left: 10)),

                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.grey)),

                    // width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 10, right: 10),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(50.0),
                              color: buttonPressBlueColor(),
                              border: Border.all(
                                  color: buttonPressBlueColor(),
                                  width: 2)),
                          child: Center(
                              child: Text(
                                "Send to Support",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(Icons.cancel_outlined, size: 18,))
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }

}
