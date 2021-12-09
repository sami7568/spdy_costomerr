import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier{

  //pick drop address data
  String pickupPlaceName=""; double pickupLatitude=34.0067324;double pickupLongitude= 71.5537812;
  String dropoffPlaceName="";double dropoffLatitude=34.0011235;double dropoffLongitude=71.5593617;

  //registration data
  String? uCelNo;String? uEmail;String? uPass;String? deviceType;

  //login data
  String? uId; String? uName;

  //signout data
  String? signout;
  
  //update registration data
  void updateRegistration(String? userId,String? name,String? celno,String? email,String? pass,String? dtype){
    uId = userId;
    uCelNo = celno;
    uEmail= email;
    uPass=pass;
    uName= name;
    deviceType = dtype;
    notifyListeners();
  }
  
  //update registration data
  void updateLoginData(String? uIdd,String? celno,String? email,String? uNamee){
    uId = uIdd;
    uCelNo = celno;
    uEmail= email;
    uName = uNamee;
    notifyListeners();
  }

  //update registration data
  void updatesigout(String? signOut){
    signout = signOut;
    notifyListeners();
  }

  //update registration data
  void updateAddressess(String pickplace,String dropplace,double picklat,double picklong,double droplat,double droplong) {
    pickupPlaceName=pickplace;
    pickupLatitude=picklat;
    pickupLongitude= picklong;
    dropoffPlaceName=dropplace;
    dropoffLatitude=droplat;
    dropoffLongitude=droplong;
    notifyListeners();
  }
   String? signin;
  void updateSigninStatus(String? signin){
    signin = signin;
    notifyListeners();
  }
}