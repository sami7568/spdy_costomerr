
import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:spdycustomers/Model/JsonData/login_response.dart';
import 'package:spdycustomers/Model/JsonData/signup_response.dart';

import 'app_data.dart';

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