
import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:spdycustomers/Model/JsonData/login_response.dart';
import 'package:spdycustomers/Model/JsonData/signup_response.dart';

import 'app_data.dart';

class UpdateData{

  //update registration data
  void updateRegistrationData(SignupUserInfo signupUserInfo,BuildContext context){
    Provider.of<AppData>(context,listen: false).updateRegistration(
        signupUserInfo.userId!,
        signupUserInfo.userName!, signupUserInfo.phoneNumber!,
        signupUserInfo.email!, signupUserInfo.password!,
        signupUserInfo.deviceType!);
  }

  //update login data
  void updateLoginData(LoginResponse loginResponse, BuildContext context) {
     Provider.of<AppData>(context,listen: false).updateLoginData(
       loginResponse.userInfo!.userId,
       loginResponse.userInfo!.phoneNumber,
       loginResponse.userInfo!.email,
       loginResponse.userInfo!.userName,
     );
  }

  //update check applicable data booking step_1
  void updateCheckApplicable(bool towingCheck,bool spareCheck,bool jumeCheck,bool outGasCheck ,
      bool newBatteryCheck,BuildContext context){
    Provider.of<AppData>(context,listen: false).updatecheckdata(towingCheck, spareCheck, jumeCheck, outGasCheck, newBatteryCheck);
  }
  //update carinfo booking step_2
  void updateCarInfo(String? carMakerchosenValue,String? carModelchosenValue,String? chooseweight,int wdChooseValue,BuildContext context){
    Provider.of<AppData>(context,listen: false).updatecarinfo(carMakerchosenValue, carModelchosenValue, chooseweight, wdChooseValue);
  }
  //update towing service
  void updateTowingService(String? towingService,BuildContext context) {
    Provider.of<AppData>(context, listen: false).updateTowingService(
        towingService!);
  }

  void updatePickUpdata(String pickplace,double picklat,double picklong,BuildContext context){
      Provider.of<AppData>(context,listen: false).updatePickUpAddressess(pickplace, picklat, picklong);
  }
  void updateDropOffData(String dropplace, double droplat,double droplong,BuildContext context){
    Provider.of<AppData>(context,listen: false).updatePickUpAddressess(dropplace, droplat, droplong);
  }


}
