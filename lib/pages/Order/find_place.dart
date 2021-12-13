// ignore: file_names
// ignore: file_names
// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spdycustomers/Model/mapData/address.dart';
import 'package:spdycustomers/Model/mapData/direction_details.dart';
import 'package:spdycustomers/Model/mapData/place_prediction.dart';
import 'package:spdycustomers/Widgets/divider.dart';
import 'package:spdycustomers/assistant/request_assistant.dart';
import 'package:spdycustomers/dataHandler/update_data.dart';
import 'package:spdycustomers/global_variables.dart';
import 'package:spdycustomers/pages/Order/location_info.dart';
import 'package:spdycustomers/pages/Order/place_order.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class FindPlace extends StatefulWidget {
  FindPlace({Key? key, required this.selectlocat}) : super(key: key);
  String selectlocat;
  @override
  _FindPlaceState createState() => _FindPlaceState();
}

// Starting point latitude
double _originLatitude = 34.0067324;
// Starting point longitude
double _originLongitude = 71.5537812;
// Markers to show points on the map
Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

class _FindPlaceState extends State<FindPlace> with TickerProviderStateMixin {
  final Completer<GoogleMapController> _controller = Completer();
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
    // ignore: avoid_print
    print(currentPosition.altitude);
    // ignore: avoid_print
    print(currentPosition.latitude);

    if(widget.selectlocat=="pick"){

    }
    else{

    }

    CameraPosition cameraPosition =
    CameraPosition(target: latLatPosition, zoom: 14);
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
    return body();
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
    // ignore: avoid_print
    print("find place called $placeName");

    if(placeName.isNotEmpty){
      String autocompleteUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890";
      var res=await RequestAssistant.getRequest(autocompleteUrl);
      // ignore: avoid_print
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

  body(){
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Stack(
            children: [
              getFields(),
              getNav(),
             predicList(),
            ],
          )),
    );
  }

  getFields(){
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Location Information", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20,),
          const Text("Address", style: TextStyle(fontSize: 17, color: Colors.white, )),
          const SizedBox(height: 1,),
          gettextfiel(),
          const SizedBox(height: 10,),
          getLocateButton(),
          const SizedBox(height: 10,),
          getmap(),
        ],
      ),
    );
  }
  gettextfiel(){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
            onTap: (){
            },
            autofocus: true,
            onChanged: (val){
              findplace(val, widget.selectlocat);
            },
            decoration: InputDecoration(hintText: "Enter your Address",hintStyle: TextStyle(color: Colors.grey[500]), border:InputBorder.none,
            ),
          ),
        )
    );
  }
  getLocateButton(){
    return GestureDetector(
      onTap: (){
        locatePosition();
      },
      child: Row(
        children: const [
          Icon(
            Icons.gps_fixed_outlined,
          ),
          SizedBox(width: 10,),
          Text(
              "Locate me",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
  getmap(){
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90),
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
        )
    );
  }
  getNav(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: const [
                  Icon(Icons.navigate_before, color: Colors.white, size: 60,),
                  Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),

                ],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // Text("Step 1 of 4", style: TextStyle(fontSize: 15, color: Colors.white),),
            // ignore: deprecated_member_use
            FlatButton(
              child: Row(
                children: const [
                  Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
                  Icon(Icons.navigate_next, color: Colors.white, size: 60,),
                ],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceOrder()));
              },
            )
          ],
        ),
      ),
    );
  }
  predicList(){
    return  Positioned(
      top: predcontainertop,
      left: 80,
      right: 40,
      bottom: predcontainerbuttom,
      child:
      (placesPredictionList.isNotEmpty)
          ? Container(
        height: predictionheight,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 7.0),
          child: ListView.separated(
            padding: const EdgeInsets.all(0.0),
            itemBuilder:(context,index){
              return PredictionTile(placePredictions: placesPredictionList[index],seleclocation: widget.selectlocat,);
            },
            separatorBuilder: (BuildContext context, int index)=> const DividerWidget(),
            itemCount: placesPredictionList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),),
      )
          : Container(),
    );
  }
}

class PredictionTile extends StatefulWidget {
  final PlacePredictions placePredictions;
  String seleclocation;
  PredictionTile({Key? key, required this.placePredictions,required this.seleclocation}) : super(key: key);
  @override
  _PredictionTileState createState() => _PredictionTileState();
}
class _PredictionTileState extends State<PredictionTile> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      //padding: EdgeInsets.all(0.0),
      onPressed: (){
          // ignore: avoid_print
          print(widget.placePredictions.mainText);
          getPlaceAddressDetails(widget.placePredictions.placeId, context);
      },
      child: Column(
        children: [
          const SizedBox(width: 10.0,),
          Row(
            children: [
              const Icon(Icons.add_location),
              const SizedBox(width:14.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0,),
                    // ignore: unnecessary_null_comparison
                    Text((widget.placePredictions.mainText!=null)?widget.placePredictions.mainText:"searching location",overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16.0),),
                    const SizedBox(height: 2.0,),
                    Text(widget.placePredictions.secondaryText,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize:12.0, color: Colors.grey),),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 10.0,),
        ],
      ),
    );
  }

  void getPlaceAddressDetails(String placeId, context) async{

    String placeAddressUrl="https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";
    var res= await RequestAssistant.getRequest(placeAddressUrl);
    if(res == "failed"){
      // ignore: avoid_print
      print('result failed');
      return;
    }
    if(res["status"]=="OK") {
      Address address = Address();
      address.placeName = res["result"]["name"];
      address.placeId = placeId;
      address.latitude = res["result"]["geometry"]["location"]["lat"];
      address.longitude = res["result"]["geometry"]["location"]["lng"];
     
      if(widget.seleclocation=="pick") {
        // ignore: avoid_print
        print("pick");
        setState(() {
        pickupLocationSelected = true;
        });
        String pickupPlaceName="";
        double pickupLatitude=34.0067324;
        double pickupLongitude= 71.5537812;
        pickupPlaceName = address.placeName.toString();
        pickupLatitude = address.latitude!;
        pickupLongitude = address.longitude!;
        UpdateData().updatePickUpdata(pickupPlaceName, pickupLatitude, pickupLongitude, context);
      }
      else{
        // ignore: avoid_print
        print("drop");
        setState(() {
          dropoffLocationSelected = true;
        });
        String? dropoffPlaceName="";
        double dropoffLatitude=34.0011235;
        double dropoffLongitude=71.5593617;
        dropoffPlaceName = address.placeName.toString();
        // ignore: avoid_print
        print("dropof place name ");
        // ignore: avoid_print
        print(dropoffPlaceName);
        dropoffLatitude = address.latitude!;
        dropoffLongitude = address.longitude!;
        UpdateData().updateDropOffData(dropoffPlaceName, dropoffLatitude, dropoffLongitude, context);
      }
      Navigator.pop(context);
    }
  }
}

