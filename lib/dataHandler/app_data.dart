import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier{

  //pick drop address data
  String? pickupPlaceName=""; double pickupLatitude=34.0067324;double pickupLongitude= 71.5537812;
  String? dropoffPlaceName="";double dropoffLatitude=34.0011235;double dropoffLongitude=71.5593617;

  //registration data
  String? uCelNo;String? uEmail;String? uPass;String? deviceType;

  //login data
  String? uId; String? uName;

  //signout data
  String? signout;
  String? signin;
  
  //towing service step 3
  String twoingService="";
  
  //checking applicable booking step1
  bool towingCheck = false;bool spareCheck = false;bool jumeCheck = false;bool outGasCheck = false;bool newBatteryCheck = false;
  //car info booking step2
  String? carMakerchosenValue;String? carModelchosenValue;String? chooseweight;int wdChooseValue=-1;
  
  //twoingserviece booking step 3
  void updateTowingService(String towingService){
    this.twoingService = towingService;
    notifyListeners();
  }
  //car info booking step2
  void updatecarinfo(String? carMakerchosenValue,String? carModelchosenValue,String? chooseweight,int wdChooseValue){
    this.carModelchosenValue = carModelchosenValue;
    this.carMakerchosenValue=carMakerchosenValue;
    this.chooseweight = chooseweight;
    this.wdChooseValue = wdChooseValue;
    notifyListeners();
  }
  //update check applicable booking step1
  void updatecheckdata(bool towingCheck,bool spareCheck,bool jumeCheck,bool outGasCheck ,bool newBatteryCheck){
   this.towingCheck=towingCheck;
   this.spareCheck = spareCheck;
   this.jumeCheck= jumeCheck;
   this.newBatteryCheck= newBatteryCheck;
   this.outGasCheck = outGasCheck;
   notifyListeners();
 }

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
  
  //update Login data
  void updateLoginData(String? uIdd,String? celno,String? email,String? uNamee){
    uId = uIdd;
    uCelNo = celno;
    uEmail= email;
    uName = uNamee;
    notifyListeners();
  }

  //update signout data
  void updatesigout(String? signOut){
    signout = signOut;
    notifyListeners();
  }

  //update Address data
  void updatePickUpAddressess(String pickplace,double picklat,double picklong,) {
    pickupPlaceName=pickplace;
    pickupLatitude=picklat;
    pickupLongitude= picklong;
    notifyListeners();
  }
  void updateDropOffAddressess(String dropplace, double droplat,double droplong) {
    dropoffPlaceName=dropplace;
    dropoffLatitude=droplat;
    dropoffLongitude=droplong;
    notifyListeners();
  }


  void updateSigninStatus(String? signin){
    signin = signin;
    notifyListeners();
  }
  
}