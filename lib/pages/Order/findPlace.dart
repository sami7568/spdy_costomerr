// ignore: file_names
// ignore: file_names
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
import 'package:spdycustomers/pages/Order/locationInfo.dart';
import 'package:spdycustomers/pages/Order/placeOrder.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:spdycustomers/prefdata.dart';

import 'chooseService.dart';

class FindPlace extends StatefulWidget {
  FindPlace({required this.selectlocat});
  String selectlocat;
  @override
  _FindPlaceState createState() => _FindPlaceState();
}

// Starting point latitude
double _originLatitude = 34.0067324;
// Starting point longitude
double _originLongitude = 71.5537812;
// Destination latitude ,
double _destLatitude = 34.0011235;
// Destination Longitude
double _destLongitude = 71.5593617;
// Markers to show points on the map
Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

class _FindPlaceState extends State<FindPlace> with TickerProviderStateMixin {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController newGoogleMapController;
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
    markers.clear();
    placesPredictionList.clear();
    super.initState();
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude,position.longitude);
    print(currentPosition.altitude);
    print(currentPosition.latitude);

    CameraPosition cameraPosition =
    new CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    //  print("this is your address " + address);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 14.4746,
  );

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
                    Text("Location Information", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20,),
                    Text("Address", style: TextStyle(fontSize: 17, color: Colors.white, )),
                    SizedBox(height: 1,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            onChanged: (val){
                              findplace(val, widget.selectlocat);
                            },
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
              ),
              Positioned(
                top: predcontainertop,
                left: 80,
                right: 40,
                bottom: predcontainerbuttom,
                child:
                (placesPredictionList.length>0)
                    ? Container(
                        height: predictionheight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 7.0),
                          child: ListView.separated(
                            padding: EdgeInsets.all(0.0),
                            itemBuilder:(context,index){
                              return PredictionTile(placePredictions: placesPredictionList[index],seleclocation: widget.selectlocat,);
                            },
                            separatorBuilder: (BuildContext context, int index)=> DividerWidget(),
                            itemCount: placesPredictionList.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                    ),),
                )
                    : Container(),
              ),
            ],
          )),
    );
  }
  void findplace(String placeName,String pickdrop)async
  {
    // if(pickdrop == "pick") {
    //   setState(() {
    //     if(drop == true) {
    //       drop = false;
    //       pick = true;
    //     }else{
    //       pick=true;
    //     }
    //   });
    // }
    // else{
    //   setState(() {
    //     if(pick == true) {
    //       pick = false;
    //       drop = false;
    //     }
    //     else{
    //       drop = true;
    //     }
    //     });
    // }
    print("find place called $placeName");

    if(placeName.length>=1){
      String autocompleteUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890";
      var res=await RequestAssistant.getRequest(autocompleteUrl);
      print("res $res");
      if(res=="failed"){
        return;
      }
      if(res["status"]=="OK"){
        var prediction=res["predictions"];

        var placesList = (prediction as List).map((e) => PlacePredictions.fromJson(e)).toList();
        setState(() {
          placesPredictionList= placesList;
        });
      }
    }
  }
}


class PredictionTile extends StatefulWidget {
  final PlacePredictions placePredictions;
  String seleclocation;
  PredictionTile({required this.placePredictions,required this.seleclocation});
  @override
  _PredictionTileState createState() => _PredictionTileState();
}
class _PredictionTileState extends State<PredictionTile> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      //padding: EdgeInsets.all(0.0),
      onPressed: (){
          print(widget.placePredictions.main_text);
          getPlaceAddressDetails(widget.placePredictions.place_id, context);
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(width: 10.0,),
            Row(
              children: [
                Icon(Icons.add_location),
                SizedBox(width:14.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0,),
                      Text((widget.placePredictions.main_text!=null)?widget.placePredictions.main_text:"searching location",overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.0),),
                      SizedBox(height: 2.0,),
                      Text(widget.placePredictions.secondary_text,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:12.0, color: Colors.grey),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(width: 10.0,),
          ],
        ),
      ),
    );
  }

  void getPlaceAddressDetails(String placeId, context) async{

    String placeAddressUrl="https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";
    var res= await RequestAssistant.getRequest(placeAddressUrl);
    if(res == "failed"){
      print('result failed');
      return;
    }
    if(res["status"]=="OK") {
      Address address = Address();
      address.placeName = res["result"]["name"];
      address.placeId = placeId;
      address.latitude = res["result"]["geometry"]["location"]["lat"];
      address.longitude = res["result"]["geometry"]["location"]["lng"];
      //
      // //save these info
      //  SharedPreferences prefs = await SharedPreferences.getInstance();
      // if(widget.seleclocation == "pick")
      // {
      //
      //   pickupLocationSelected = true;
      //
      //   await prefs.setString(
      //       Data.pickupPlaceName!, address.placeName.toString());
      //   await prefs.setString(
      //       Data.pickupLatitude!, address.latitude.toString());
      //   await prefs.setString(
      //       Data.pickupLongitude!, address.longitude.toString());
      // }
      // else
      //   {
      //     dropoffLocationSelected = true;
      //
      //     await prefs.setString(
      //         Data.dropoffPlaceName!, address.placeName.toString());
      //     await prefs.setString(
      //         Data.dropoffLatitude!, address.latitude.toString());
      //     await prefs.setString(
      //         Data.dropoffLongitude!, address.longitude.toString());
      //   }
      if(widget.seleclocation=="pick")
      setState(() {
        print("pickuplocatio;lldsjfal;j");
        pickupLocationSelected = true;
        pickupPlaceName = address.placeName.toString();
        pickupLatitude = address.latitude!;
        pickupLongitude = address.longitude!;
      });
      else{
        dropoffLocationSelected = true;
        dropoffPlaceName = address.placeName.toString();
        dropoffLatitude = address.latitude!;
        dropoffLongitude = address.longitude!;
      }
      Navigator.pop(context);
    }
  }
}

