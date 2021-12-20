import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spdycustomers/Model/JsonData/all_drivers.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/pages/Order/location_info.dart';
import 'package:spdycustomers/pages/Order/new_order.dart';
import 'package:spdycustomers/Widgets/colors.dart';

import 'menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Position currentPosition;
  var geolocator = Geolocator();
  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = const LatLng(34.0011235,71.5593617);
    CameraPosition cameraPosition = CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.0011235, 71.5593617),
    zoom: 14.4746,
  );

  final double _originLatitude1=34.0011235;final double _originLongitude1=71.5593617;

  final double _originLatitude2=34.0079799;final double _originLongitude2=71.5693429;

  final double _originLatitude3=34.0072113;final double _originLongitude3=71.5592424;

  final double _originLatitude4=34.0010489;final double _originLongitude4=71.5432891;

  final double _originLatitude5=34.0023257;final double _originLongitude5=71.5479966;

  final double _originLatitude6=34.0130064;final double _originLongitude6=71.5676102;

  final double _originLatitude7=34.0027043;final _originLongitude7=71.5655506;

  final double _originLatitude8=33.9936418;final double _originLongitude8=71.5418315;

  final double _originLatitude9=33.9909642;final double _originLongitude9=71.556182;

  final double _originLatitude10=34.0128336;final double _originLongitude10=71.567465;

  Set<Marker> markerSet = {};
  int? countdrivers=0;
  @override
  void initState() {
    markers.clear();
    addMarker();
    getOnlineDrivers();
    super.initState();
  }
  getOnlineDrivers()async{
    AllDrivers? allDrivers = await ApiServices.allDrivers();
    print(allDrivers!.driverInfo!.length);
    setState(() {
      countdrivers = allDrivers.driverInfo!.length;
    });
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
    return body();
  }
  body(){
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          getMap(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
            child: Container(
              alignment: Alignment.center ,
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: backgroundColor(),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Text("There are "+ countdrivers!.toString() +" online providers nearby.", style: TextStyle(fontSize: 16, color: Colors.white,letterSpacing: 1),),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  getNerOrderButton(),
                  const SizedBox(height: 15,),
                  getMenuButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  getMenuButton(){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));
      },
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
    );
  }
  getNerOrderButton(){
    return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewOrder()));
        },
        child: Container(
          width: 280,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: buttonPressBlueColor()),
          child: const Center(
              child: Text(
                "New Order",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
      ),
    );
  }
  getMap(){
    return GoogleMap(
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
    );
  }

}
