
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/Model/JsonData/loginResponse.dart';
import 'package:spdycustomers/Model/JsonData/signupResponse.dart';

import 'appData.dart';

class UpdateData{

  void updateRegistrationData(SignupUserInfo signupUserInfo,BuildContext context){
    Provider.of<AppData>(context,listen: false).updateRegistration(
        signupUserInfo.userId!,
        signupUserInfo.userName!, signupUserInfo.phoneNumber!,
        signupUserInfo.email!, signupUserInfo.password!,
        signupUserInfo.deviceType!);
  }

  void updateLoginData(LoginResponse loginResponse, BuildContext context) {
     Provider.of<AppData>(context,listen: false).updateLoginData(
       loginResponse.userInfo!.userId,
       loginResponse.userInfo!.phoneNumber,
       loginResponse.userInfo!.email,
       loginResponse.userInfo!.userName,
     );
  }



}