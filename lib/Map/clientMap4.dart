import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Ratings/ratingScreen.dart';

class ClientMap_4 extends StatefulWidget {
  @override
  _ClientMap_4State createState() => _ClientMap_4State();
}

class _ClientMap_4State extends State<ClientMap_4> {
  Color confirmColor = Colors.white;

  @override
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Position currentPosition;
  var geolocator = Geolocator();
  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 170,
              width: 400,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order #123-ABC",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.more_vert)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("ABC Towning",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Light Towing, Flatbed, New Battery Install",
                          style: TextStyle(
                            fontSize: 15,
                          ))),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                          border: Border.all(color: greenColor(), width: 2)),
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
              ),
            ),
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
                      decoration: BoxDecoration(color: greenColor()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Order is completed.",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                confirmColor == Colors.white
                                    ? confirmColor = buttonPressBlueColor()
                                    : confirmColor = Colors.white;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RatingScreen()));
                            },
                            child: Text(
                              "confirm",
                              style: TextStyle(
                                  color: confirmColor == buttonPressBlueColor()
                                      ? Colors.white
                                      : buttonPressBlueColor(),
                                  fontWeight: FontWeight.bold),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: confirmColor,
                              shape: StadiumBorder(),
                              side: BorderSide(
                                  width: 2.0, color: buttonPressBlueColor()),
                            ),
                          ),
                          // ElevatedButton(
                          //     style: ButtonStyle(
                          //         backgroundColor: ,
                          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          //             RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(18.0),
                          //                 side: BorderSide(color: buttonPressBlueColor())
                          //             )
                          //         )
                          //     ), onPressed: () {  }, child: Text("confirm", style: TextStyle(color: buttonPressBlueColor(), fontWeight: FontWeight.bold),),
                          // )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
          //Hamburger Button for drawer
        ],
      ),
    );
  }
}
