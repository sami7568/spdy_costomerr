// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/Model/mapData/direction_details.dart';
import 'package:spdycustomers/Model/mapData/place_prediction.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/global_variables.dart';
import 'package:spdycustomers/pages/Order/find_place.dart';
import 'package:spdycustomers/pages/Order/place_order.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// ignore: must_be_immutable
class LocationInfo extends StatefulWidget {
  const LocationInfo({Key? key}) : super(key: key);
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
  final Completer<GoogleMapController> _controller = Completer();

  GoogleMapController? newGoogleMapController;
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
    locatePosition();
    markers.clear();
    polylines.clear();
    super.initState();
  }

  @override
  void dispose() {
    polylines.clear();
    super.dispose();
  }

  setpickupdropoffvalues(){
    // print(Provider.of<AppData>(context,listen:false).pickupPlaceName.toString());
    // print(Provider.of<AppData>(context,listen:false).dropoffPlaceName.toString());

    String? pickupplace = Provider.of<AppData>(context,listen:false).pickupPlaceName.toString();
    String? dropoffplace = Provider.of<AppData>(context,listen:false).dropoffPlaceName.toString();
    pickupAddressController.text = pickupplace;
    dropoffAddressController.text = dropoffplace;
    addpolyy();
  }
  @override
  Widget build(BuildContext context) {
    setpickupdropoffvalues();
    return body();
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
  body(){
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: backgroundColor(),
              child: Stack(
                children: [
                  getFields(),
                  getNav(),
                ],
              ))
        ],
      ),
    );
  }
  getNav(){
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ignore: deprecated_member_use
            backButton(),
            // Text("Step 1 of 4", style: TextStyle(fontSize: 15, color: Colors.white),),
            // ignore: deprecated_member_use
            forwardButton()
          ],
        ),
      ),
    );
  }
  backButton(){
    // ignore: deprecated_member_use
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(Icons.navigate_before, color: Colors.white, size: 60,),
          Text('Back', style: TextStyle(color: Colors.white, fontSize: 20),),
        ],
      ),
      onPressed: () {
        backalert();
        //Navigator.pop(context);
      },
    );
  }
  backalert(){
    return  AwesomeDialog(
        context: context,
        title: "Warning",
        desc: "Are You Sure You want to go back",
        dialogType: DialogType.WARNING,
        btnCancelOnPress: (){},
        btnOkOnPress: (){
          Navigator.pop(context);
        }
    ).show();
  }
  forwardButton(){
    // ignore: deprecated_member_use
    return FlatButton(
      child: Row(
        children: const [
          Text('Next', style: TextStyle(color: Colors.white, fontSize: 20),),
          Icon(Icons.navigate_next, color: Colors.white, size: 60,),
        ],
      ),
      onPressed: () {
        String? pick = Provider.of<AppData>(context,listen: false).pickupPlaceName;
        String? drop = Provider.of<AppData>(context,listen: false).dropoffPlaceName;

        if(pick!.isEmpty || drop!.isEmpty){
          forwardalert();
        }
        else {
          getTrueServices();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PlaceOrder()));
        }
        },
    );
  }
  getFields(){
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Location Information", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20,),
          const Text("Pick-Up", style: TextStyle(fontSize: 17, color: Colors.white, )),
          const SizedBox(height: 1,),
          pickUpfield(),
          const SizedBox(height: 5,),
          const Text("Drop-Off", style: TextStyle(fontSize: 17, color: Colors.white, )),
          const SizedBox(height: 1,),
          dropoffField(),
          const SizedBox(height: 10,),
          locatemeButton(),
          const SizedBox(height: 10,),
          getmap(),
        ],
      ),
    );
  }
  locatemeButton(){
    return Row(
      children: [
        const Icon(
          Icons.gps_fixed_outlined,
        ),
        const SizedBox(width: 10,),
        GestureDetector(
            onTap: (){
              locatePosition();
            },
            child: const Text(
                "Locate me",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ))),
      ],
    );
  }
  pickUpfield(){
    return Container(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
            onTap: (){
              // ignore: avoid_print
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
    );
  }
  dropoffField(){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
    );
  }
  forwardalert(){
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      title: 'Error',
      desc: 'Please choose Pick/Drop Address.....',
      btnOkOnPress: () {
        // Navigator.pop(context);
      },
    ).show();
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    currentPosition = position;
    LatLng latLatPosition = LatLng(
        Provider.of<AppData>(context,listen: false).pickupLatitude,
        Provider.of<AppData>(context,listen: false).pickupLongitude
    );
   CameraPosition cameraPosition = CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.0067324, 71.5537812),
    zoom: 14.4746,
  );
  // This method will add markers to the map based on the LatLng position
  addMarker(LatLng position, String id, BitmapDescriptor descriptor, String? name) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(
      infoWindow: const InfoWindow(
        title: "pickup",
        snippet: "pickuplocation"
      ),
        markerId: markerId, icon: descriptor, position: position
    );
    markers[markerId] = marker;
  }
  // This method will add polyline to the map based on the origin and destination position
  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("mypolypoint");
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
     mapKey,
      PointLatLng(Provider.of<AppData>(context,listen:false).pickupLatitude,
          Provider.of<AppData>(context,listen:false).pickupLongitude),
      PointLatLng(Provider.of<AppData>(context,listen:false).dropoffLatitude,
          Provider.of<AppData>(context,listen:false).dropoffLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      // ignore: avoid_print
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      // ignore: avoid_print
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }
  void addpolyy()async{

    if( pickupLocationSelected! && dropoffLocationSelected!){
      addMarker(
        LatLng(Provider.of<AppData>(context,listen:false).dropoffLatitude, Provider.of<AppData>(context,listen:false).dropoffLongitude),
        "destination",
        BitmapDescriptor.defaultMarkerWithHue(90),
        Provider.of<AppData>(context).dropoffPlaceName,
      );
      getPolyline();
      locatePosition();
    }
  else if(pickupLocationSelected!) {
      // add origin marker origin marker
      addMarker(
        LatLng(Provider.of<AppData>(context,listen:false).pickupLatitude,Provider.of<AppData>(context,listen:false).pickupLongitude ),
        "origin",
        BitmapDescriptor.defaultMarker,
        Provider.of<AppData>(context).pickupPlaceName,
      );
    }
   else if(dropoffLocationSelected!){
    // Add destination marker
    addMarker(
      LatLng(Provider.of<AppData>(context,listen:false).dropoffLatitude, Provider.of<AppData>(context,listen:false).dropoffLongitude),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
      Provider.of<AppData>(context).dropoffPlaceName,
    );
    }
  }

  getTrueServices() {
    bool battery =  Provider.of<AppData>(context,listen: false).newBatteryCheck;
    bool towing=  Provider.of<AppData>(context,listen: false).towingCheck;
    bool outgas =  Provider.of<AppData>(context,listen: false).outGasCheck;
    bool jump = Provider.of<AppData>(context,listen: false).jumeCheck;
    bool spare = Provider.of<AppData>(context,listen: false).spareCheck;
    String  towingService = Provider.of<AppData>(context,listen: false).twoingService;

    if(battery){
      orderList.add("batter");
    }
    if(towing){
      orderList.add("tow");
    }
    if(outgas){
      orderList.add("fuel");
    }
    if(jump){
      orderList.add("Jump start");
    }
    if(spare){
      orderList.add("spare tire");
    }
    for (var element in orderList) {
      // ignore: avoid_print
      print( element);
    }
  }
}

