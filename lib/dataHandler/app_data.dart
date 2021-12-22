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
  String? signout;String? signin;
  
  //towing service step 3
  String twoingService="";
  
  //checking applicable booking step1
  bool towingCheck = false;bool spareCheck = false;bool jumeCheck = false;bool outGasCheck = false;bool newBatteryCheck = false;String? roadside_assistance;
  //car info booking step2
  String? carMakerchosenValue, carModelchosenValue,carYear, chooseweight;int wdChooseValue=-1;

  //credit card no, credit, apple pay,
  String? cardNo; String? cardexpiry; String? cardpin; String? NameCard;bool? saveCardData;

  //driver data
  String? driverId;String? driverName;String? driverEmail;String? cellNumber;String? password;String? licenseNumber;String? licenseIssueDate;
  String? licenseExpirationDate;String? dateOfBirth;String? stateId;String? licenseTypeId;String? companyId;String? bankAccountHolder;
  String? bankAccountNumber;String? routingNumber;String? bankName;String? bankAddress;String? towTruckMakeId;String? towYear;String? towModelId;
  String? towTruckTypeId;String? towWeight;String? roadsideAssistance;String? lastSignin;String? signupDate;String? isApproved;String? loginStatus;String? isDeleted;

  //update driver data
  void updateDriverData( String? driverId, String? driverName,String? driverEmail,String? cellNumber,String? password,String? licenseNumber,String? licenseIssueDate, String? licenseExpirationDate,String? dateOfBirth,String? stateId,String? licenseTypeId,String? companyId,String? bankAccountHolder,String? bankAccountNumber, String? routingNumber,String? bankName,String? bankAddress,String? towTruckMakeId,String? towYear,String? towModelId,String? towTruckTypeId,String? towWeight,String? roadsideAssistance,String? lastSignin,String? signupDate,String? isApproved,String? loginStatus,String? isDeleted){
    this.driverId = driverId;this.driverName = driverName;this.driverEmail= driverEmail;this.cellNumber= cellNumber;this.password= password;
    this.licenseNumber= licenseNumber;this.licenseIssueDate= licenseIssueDate;this.licenseExpirationDate= licenseExpirationDate;this.dateOfBirth= dateOfBirth;
    this.stateId= stateId;this.licenseTypeId= licenseTypeId;this.companyId= companyId;this.bankAccountHolder= bankAccountHolder;this.bankAccountNumber= bankAccountNumber;
    this.routingNumber= routingNumber;this.bankName= bankName;this.bankAddress= bankAddress;this.towTruckMakeId= towTruckMakeId;this.towYear= towYear;
    this.towModelId= towModelId;this.towTruckTypeId= towTruckTypeId;this.towWeight= towWeight;this.roadsideAssistance= roadsideAssistance;
    this.lastSignin= lastSignin;this.signupDate= signupDate;this.isApproved= isApproved;this.loginStatus= loginStatus;this.isDeleted= isDeleted;
    notifyListeners();
  }
  void updateuserId(String? uId){
    this.uId=uId;
    notifyListeners();
  }
  //update credit, apple pay, card data
  void updateCardInfo(String? cardNo, String? cardexpiry, String? cardpin, String? NameCard,bool? saveCardData){
    this.cardNo = cardNo;
    this.cardexpiry = cardexpiry;
    this.cardpin = cardpin;
    this.NameCard = NameCard;
    this.saveCardData = saveCardData;
    notifyListeners();
  }

  //twoingserviece booking step 3
  void updateTowingService(String towingService){
    twoingService = towingService;
    notifyListeners();
  }
  //car info booking step2
  void updatecarinfo(String? carMakerchosenValue,String? carModelchosenValue,String? carYear,String? chooseweight,int wdChooseValue){
    this.carModelchosenValue = carModelchosenValue;
    this.carMakerchosenValue=carMakerchosenValue;
    this.carYear = carYear;
    this.chooseweight = chooseweight;
    this.wdChooseValue = wdChooseValue;
    notifyListeners();
  }
  //update check applicable booking step1
  void updatecheckdata(bool towingCheck,bool spareCheck,bool jumeCheck,bool outGasCheck ,bool newBatteryCheck,String? roadside_assistance){
   this.roadside_assistance = roadside_assistance;
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

  //update signin status
  void updateSigninStatus(String? signin){
    signin = signin;
    notifyListeners();
  }
  
}