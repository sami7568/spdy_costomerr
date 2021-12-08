import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/dataHandler/appData.dart';
import 'package:spdycustomers/pages/Order/locationInfo.dart';
import 'package:spdycustomers/pages/Order/newOrder.dart';
import 'package:spdycustomers/Widgets/colors.dart';

import 'menu.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    LatLng latLatPosition = LatLng(34.0011235,71.5593617);
    CameraPosition cameraPosition = CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.0011235, 71.5593617),
    zoom: 14.4746,
  );

  double _originLatitude1=34.0011235;double _originLongitude1=71.5593617;

  double _originLatitude2=34.0079799;double _originLongitude2=71.5693429;

  double _originLatitude3=34.0072113;double _originLongitude3=71.5592424;

  double _originLatitude4=34.0010489;double _originLongitude4=71.5432891;

  double _originLatitude5=34.0023257;double _originLongitude5=71.5479966;

  double _originLatitude6=34.0130064;double _originLongitude6=71.5676102;

  double _originLatitude7=34.0027043;double _originLongitude7=71.5655506;

  double _originLatitude8=33.9936418;double _originLongitude8=71.5418315;

  double _originLatitude9=33.9909642;double _originLongitude9=71.556182;

  double _originLatitude10=34.0128336;double _originLongitude10=71.567465;

  Set<Marker> markerSet = {};

  @override
  void initState() {
    markers.clear();
    addMarker();
    super.initState();
  }

  void addMarker(){
    _addMarker(
      LatLng(_originLatitude1, _originLongitude1),
      "1",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude2, _originLongitude2),
      "2",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude3, _originLongitude3),
      "3",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude4, _originLongitude4),
      "4",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude5, _originLongitude5),
      "5",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude6, _originLongitude6),
      "6",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude7, _originLongitude7),
      "7",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude8, _originLongitude8),
      "8",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude9, _originLongitude9),
      "9",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    _addMarker(
      LatLng(_originLatitude10, _originLongitude10),
      "10",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

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
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              newGoogleMapController = controller;
              locatePosition();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
            child: Container(
              alignment: Alignment.center ,
              padding: EdgeInsets.all(10),
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: backgroundColor(),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text("There are 10 online providers nearby.", style: TextStyle(fontSize: 16, color: Colors.white,letterSpacing: 1),),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewOrder()));
                      },
                      child: Container(
                        width: 280,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: buttonPressBlueColor()),
                        child: Center(
                            child: Text(
                              "New Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                    },
                    child: Icon(
                      Icons.menu,
                      color: buttonPressBlueColor(),
                      size: 50,
                    ),
                  ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                },
                  child: Text(
                    "Menu",
                    style: TextStyle(
                        color: buttonPressBlueColor(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
