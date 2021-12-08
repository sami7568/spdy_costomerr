// ignore: file_names
// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spdycustomers/Model/mapData/address.dart';
import 'package:spdycustomers/Model/mapData/directionDetails.dart';
import 'package:spdycustomers/Model/mapData/placePrediction.dart';
import 'package:spdycustomers/Widgets/divider.dart';
import 'package:spdycustomers/assistant/requestAssistant.dart';
import 'package:spdycustomers/globalVariables.dart';
import 'package:spdycustomers/pages/Order/findPlace.dart';
import 'package:spdycustomers/pages/Order/placeOrder.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import '../../prefdata.dart';

class LocationInfo extends StatefulWidget {

  String? twoingService;
  LocationInfo({this.twoingService});
  @override
  _LocationInfoState createState() => _LocationInfoState();
}


// Markers to show points on the map
Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};
List<PlacePredictions> placesPredictionList=[];

TextEditingController pickupAddressController = TextEditingController();
TextEditingController dropoffAddressController = TextEditingController();

class _LocationInfoState extends State<LocationInfo> with TickerProviderStateMixin {
  Completer<GoogleMapController> _controller = Completer();

  late GoogleMapController? newGoogleMapController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late DirectionDetails tripDirectionDetails;
  List<LatLng> pLineCoordinates = [];
  late Position currentPosition;
  var geolocator = Geolocator();
  Set<Polyline> polyLineSet = {};
  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};
  double predictionheight=60;
  double predcontainertop = 180;
  double predcontainerbuttom = 280;

  @override
  void initState() {
    // SharedPreferences.setMockInitialValues({});
   // markers.clear();
    super.initState();
  }
  setpickupdropoffvalues(){
    pickupAddressController.text = pickupPlaceName!= null?pickupPlaceName.toString(): "";
    dropoffAddressController.text = dropoffPlaceName!=null?dropoffPlaceName.toString():"";
    addpolyy();
  }
  @override
  Widget build(BuildContext context) {
    setpickupdropoffvalues();
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                        Text("Location Information", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20,),
                        Text("Pick-Up", style: TextStyle(fontSize: 17, color: Colors.white, )),
                        SizedBox(height: 1,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                onTap: (){
                                  print("tapped");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FindPlace(selectlocat: "pick",)));
                                },
                                controller: pickupAddressController,
                                decoration: InputDecoration(
                                  hintText: "Enter your Address",
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  border:InputBorder.none,
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 5,),
                        Text("Drop-Off", style: TextStyle(fontSize: 17, color: Colors.white, )),
                        SizedBox(height: 1,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FindPlace(selectlocat: "drop",)));
                                },
                                controller: dropoffAddressController,
                                decoration: InputDecoration(hintText: "Enter your Address",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(
                              Icons.gps_fixed_outlined,
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                                onTap: (){
                                  locatePosition();
                                },
                                child: Text(
                                    "Locate me",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                    ))),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 90),
                              child: Container(
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  myLocationButtonEnabled: false,
                                  initialCameraPosition: _kGooglePlex,
                                  myLocationEnabled: true,
                                  tiltGesturesEnabled: true,
                                  compassEnabled: true,
                                  scrollGesturesEnabled: true,
                                  zoomGesturesEnabled: true,
                                  zoomControlsEnabled: true,
                                  polylines: Set<Polyline>.of(polylines.values),
                                  markers: Set<Marker>.of(markers.values),
                                  onMapCreated: (GoogleMapController controller) {
                                    _controller.complete(controller);
                                    newGoogleMapController = controller;
                                    //locatePosition();
                                  },
                                ),
                              ),
                            )
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
                              Navigator.pop(context);
                            },
                          ),
                          // Text("Step 1 of 4", style: TextStyle(fontSize: 15, color: Colors.white),),
                          FlatButton(
                            child: Row(
                              children: [
                                Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
                                Icon(Icons.navigate_next, color: Colors.white, size: 60,),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder()));
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          // Positioned(
          //   top: predcontainertop,
          //   left: 80,
          //   right: 40,
          //   bottom: predcontainerbuttom,
          //    child:
          //    (placesPredictionList.length>0)
          //       ? Container(
          //         height: predictionheight,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //         ),
          //         child: Padding(
          //           padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 7.0),
          //           child: ListView.separated(
          //             padding: EdgeInsets.all(0.0),
          //             itemBuilder:(context,index){
          //               return PredictionTile(placePredictions: placesPredictionList[index],);
          //             },
          //             separatorBuilder: (BuildContext context, int index)=> DividerWidget(),
          //             itemCount: placesPredictionList.length,
          //             shrinkWrap: true,
          //             physics: ClampingScrollPhysics(),
          //           ),),
          //       )
          //        : Container(),
          // ),
        ],
      ),
    );
  }
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    currentPosition = position;

    LatLng latLatPosition = LatLng(pickupLatitude,pickupLongitude);
   CameraPosition cameraPosition =
    new CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(pickupLatitude, pickupLongitude),
    zoom: 14.4746,
  );

  // This method will add markers to the map based on the LatLng position
  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }
  // This method will add polyline to the map based on the origin and destination position
  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("mypolypoint");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void getPolyline() async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyA5QBupZfYDYDMVGNOC53nGAF7K5FuDa1I",
      PointLatLng(pickupLatitude, pickupLongitude),
      PointLatLng(dropoffLatitude,dropoffLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  void addpolyy()async{
    if(pickupLocationSelected == true && dropoffLocationSelected == true){
      getPolyline();
      locatePosition();
    }
  else if(pickupLocationSelected==true) {
      // add origin marker origin marker
      addMarker(
        LatLng(pickupLatitude, pickupLongitude),
        "origin",
        BitmapDescriptor.defaultMarker,
      );
    }
   else if(dropoffLocationSelected == true){
    // Add destination marker
    addMarker(
      LatLng(dropoffLatitude, dropoffLongitude),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );
    }
  }
}

