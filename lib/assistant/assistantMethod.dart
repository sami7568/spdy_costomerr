
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spdycustomers/Model/mapData/address.dart';
import 'package:spdycustomers/Model/mapData/directionDetails.dart';
import 'package:spdycustomers/assistant/requestAssistant.dart';

import '../globalVariables.dart';


class AssistantMethods{

  static Future<String> searchCoordinateAddress(Position position,context) async {
    String placeAddress="";
    String st1,st2,st3,st4;
    String url="https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response=await RequestAssistant.getRequest(url);

    if(response=="OK"){
//      placeAddress =response["results"][0]["formatted_address"];
      st1 =response["results"][0]["address_components"][0]["long_name"];
      st3 =response["results"][0]["address_components"][1]["long_name"];
      st4 =response["results"][0]["address_components"][4]["long_name"];
      placeAddress=st1 +", "+st3+", "+st4;
      Address userPickUpAddress= new Address();
      userPickUpAddress.longitude=position.longitude;
      userPickUpAddress.latitude=position.latitude;
      userPickUpAddress.placeName=placeAddress;
      print(placeAddress);
      //Provider.of<AppData>(context,listen:false).updatePickUpLocationAddress(userPickUpAddress);
    }

    return placeAddress;
  }


  static Future<DirectionDetails?> obtainPlaceDirectionDetail(LatLng initialPosition,LatLng finalPosition)async
  {
    String directionUrl="https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$mapKey";

    var res= await RequestAssistant.getRequest(directionUrl);
    if(res=="failed"){
      return null;
    }
    DirectionDetails directionDetails= DirectionDetails();
    directionDetails.encodedPoint=res["routes"][0]["overview_polyline"]["points"];

    directionDetails.distanceText=res["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.distanceValue=res["routes"][0]["legs"][0]["distance"]["value"];

    directionDetails.durationText=res["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.durationValue=res["routes"][0]["legs"][0]["duration"]["value"];

    return directionDetails;
  }

}