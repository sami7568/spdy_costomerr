import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spdycustomers/Widgets/colors.dart';
import 'package:spdycustomers/pages/Menu/menu.dart';
import 'package:spdycustomers/pages/Order/find_place.dart';
class ClientMap1 extends StatefulWidget {
  const ClientMap1({Key? key}) : super(key: key);

  @override
  _ClientMap1State createState() => _ClientMap1State();
}

class _ClientMap1State extends State<ClientMap1> {
  final Completer<GoogleMapController> _controller = Completer();
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

    static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(34.0011235, -71.5593617),
      zoom: 14.4746,
    );


    @override
    Widget build(BuildContext context) {
      return body();
    }
    body(){
      return Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            getmap(),
            orderDetail(),
            bottom(),
          ],
        ),
      );
    }
    bottom(){
      return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              const SizedBox(height: 15,),
              menubotton(),
            ],
          ),
        ),
      );
    }

    arrival(){
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              color: buttonPressBlueColor()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const <Widget>[
              Text(
                "Terry",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "will arrive in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20),
              ),
              Text(
                "15:10",
                style: TextStyle(
                    fontWeight: FontWeight.bold,

                    color: Colors.white,
                    fontSize: 30),
              ),
            ],
          ),
        ),
      );
    }

    menubotton(){
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

    orderDetail(){
      return   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 170,
          width: 400,
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text("Order #123-ABC", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Icon(Icons.more_vert)
                ],
              ),
              const SizedBox(height: 10,),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text("ABC Towning", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              const SizedBox(height: 10,),
              const Align(
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
      );
    }

    getmap(){
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
