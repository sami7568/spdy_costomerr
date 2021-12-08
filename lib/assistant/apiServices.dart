// ignore: file_names
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:spdycustomers/Model/JsonData/addCreditCardResponse.dart';
import 'package:spdycustomers/Model/JsonData/bookingResponse.dart';
import 'package:spdycustomers/Model/JsonData/deleteCreditCardRespnse.dart';
import 'package:spdycustomers/Model/JsonData/driverRatingResponse.dart';
import 'package:spdycustomers/Model/JsonData/editCreditCardResponse.dart';
import 'package:spdycustomers/Model/JsonData/loginResponse.dart';
import 'package:spdycustomers/Model/JsonData/passwordUpdateResponse.dart';
import 'package:spdycustomers/Model/JsonData/signoutResponse.dart';
import 'dart:convert';

import 'package:spdycustomers/Model/JsonData/signupResponse.dart';
import 'package:spdycustomers/Model/JsonData/userBookingListResponse.dart';
import 'package:spdycustomers/Model/JsonData/userCreditCardResponse.dart';
import 'package:spdycustomers/Model/JsonData/userDataResponse.dart';
// user api services
class ApiServices{

  //signup api
  static Future<dynamic> signupRequest(String userName,String phonenumber,String email,String password,String deviceType)async{

    http.Response response= await http.post(Uri.parse("https://spdytowtruck.com/admin-panel/api/User/signup"),
      body: {
        "user_name": userName,
        "phone_number": phonenumber,
        "email": email,
        "password":password,
        "device_type":deviceType,
      },
    );
    try
    {
      if(response.statusCode==200)
      {
        print("post done");
        print('${response.body}');
        final values = json.decode(response.body);
        SignupResponse signupResponse = SignupResponse.fromJson(values);
        print(signupResponse.signupuserInfo!.userName);
        //return msg
        return signupResponse.signupuserInfo;
      }
      else{
        return "failed";
      }
    }
    catch(exp){
      return "failed";
    }
  }

  //signin api
  static Future<dynamic?> loginUser(String phoneNumber, String password) async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/signin'),
      body: {
          "phone_number":phoneNumber,
          "password":password,
      },
    );
    try
    {
      if(response.statusCode==200)
      {
        var valueMap = json.decode(response.body);
        print("body ");
        print(valueMap);
        LoginResponse loginResponse = LoginResponse.fromJson(valueMap);
        if(loginResponse.status==200){
          return loginResponse.userInfo;
        }
        else
          return "failed";
      }
      else{
        return "failed";
      }
    }
    catch(exp){
      return "failed";
    }
  }

  //booking api
  static Future<String?> booking() async {
    final response = await http.post(
      Uri.parse('https://spdytowtruck.com/admin-panel/api/User/booking'),
      body: {
    "user_id":"1234",
    "driver_id":"341",
    "pick_up_location":"peshawar uni",
    "drop_of_location":"saddar",
    "booking_type":"abc",
    "order_date":"1/2/21",
    "order_time":"2:32",
    "service":"ads",
    "amount":"122",
      },
    );
    try
    {
      if(response.statusCode==200)
      {
        print(response.body);
        var valueMap = json.decode(response.body);
        print("body ");
        BookingResponse bookingResponse = BookingResponse.fromJson(valueMap);
        print(bookingResponse.userInfo!.pickUpLocation);
        //save data in sharedpreferences here

        return bookingResponse.msg;
      }
      else{
        return "failed";
      }
    }
    catch(exp){
      return "failed";
    }
  }

  //fetchuser api
  static Future<String?> fetchUser(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('https://spdytowtruck.com/admin-panel/api/User/user_data'),
      body: {
        "phone_number" : phoneNumber,
      }
    );
    print(response.body);
      if(response.statusCode==200)
      {
        var valueMap = jsonDecode(response.body);
        print("body ");
        print(valueMap);
        UserDataResponse userDataResponse = UserDataResponse.fromJson(valueMap);
        print("user data response user info");
        print(userDataResponse.userInfo!.userName);
        return userDataResponse.msg;
      }
      else{
        print ("failed");
      }
  }

  //updateuserprofile api
  static Future<String?> updateUerProfile(/*String userId,String userName,String firstName,String lastName*/) async {
    http.Response response = await http.post(
      Uri.parse('https://spdytowtruck.com/admin-panel/api/User/update_user_profile'),
      body: {
        "user_id":"sami",
        "user_name":"samijan",
        "first_name":"sami",
        "last_name":"jan",
      }
    );
    print(response.statusCode);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
    }
    else{
      print ("failed");
    }
  }

  //signout
  static Future<String?> signout() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/signout'),
        body: {
          "user_id" :"13",
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
      SignoutResponse userDataResponse = SignoutResponse.fromJson(valueMap);
      print("signout res");
      print(userDataResponse.msg);
      return userDataResponse.msg;
    }
    else{
      print ("failed");
    }
  }

  //update password
  static Future<String?> updatePassword() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/update_password'),
        body: {
          "user_id" :"33",
          "old_password":"1234",
          "new_password":"1233"
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
      PasswordUpdateResponse passwordUpdateResponse = PasswordUpdateResponse.fromJson(valueMap);
       print("password update res");
       print(passwordUpdateResponse.msg);
      // return userDataResponse.msg;
    }
    else{
      print ("failed");
    }
  }

  //add_credit_card
  static Future<dynamic?> addCreditCard() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/add_credit_card'),
        body: {
          "user_id" :"33",
          "card_name":"habeeb",
          "card_number":"123393940909",
          "expiration":"2022",
          "digit_number":"123",
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
      AddCreditCardResponse addCreditCardResponse = AddCreditCardResponse.fromJson(valueMap);
      print(addCreditCardResponse.cardInfo!.userId);
      return addCreditCardResponse.status;
      }
    else{
      print ("failed");
    }
  }

  //user_credit_card
  static Future<dynamic?> userCreditCards() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/user_credit_cards'),
        body: {
          "user_id" :"33",
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
      UserCreditCardResponse userCreditCardResponse = UserCreditCardResponse.fromJson(valueMap);
      userCreditCardResponse.cards!.forEach((element) {
        print("reg date");
        print(element.regDate);
      });
      userCreditCardResponse.userInfo!.cards!.forEach((element) {
        print(element.regDate);
      });
      return userCreditCardResponse.status;
    }
    else{
      print ("failed");
    }
  }

  //update_credit_card
  static Future<dynamic?> updateCreditCard() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/update_creditcard'),
        body: {
          "user_id" :"33",
          "card_name":"habeeb",
          "card_number":"78904568",
          "expiration":"2022",
          "digit_number":"123",
          "_id":"1"
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
      EditCreditCardResponse editCreditCardResponse = EditCreditCardResponse.fromJson(valueMap);
      print(editCreditCardResponse.userInfo!.cardName);
      return editCreditCardResponse.status;
    }
    else{
      print ("failed");
    }
  }

  //update_credit_card
  static Future<dynamic?> deleteCreditCard() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/delete_creditcard'),
        body: {
          "user_id" :"33",
          "_id":"1",
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
      DeleteCreditCardResponse deleteCreditCardResponse = DeleteCreditCardResponse.fromJson(valueMap);
      print(deleteCreditCardResponse.msg);
      return deleteCreditCardResponse.status;
    }
    else{
      print ("failed");
    }
  }

  //user_booking_list specific
  static Future<dynamic?> user_booking_list() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/user_booking_list'),
        body: {
          "user_id" : "1",
          "booking_status"  : "Completed",
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      print("ok");
     var valueMap = jsonDecode(response.body);
     print("body ");
     print(valueMap);
     UserBookingListResponse userBookingListResponse = UserBookingListResponse.fromJson(valueMap);
     print(userBookingListResponse.bookings!.first);
     for (var value in userBookingListResponse.bookings!) {
       print(value.driverRating);
     }
     return userBookingListResponse.msg;
    }
    else{
      print ("failed");
    }
  }

  //ratiing api
  static Future<dynamic?> rating() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/rating'),
        body: {
          "booking_id" :"1",
          "rating_value":"4",
          "user_id":"1"
        }
    );
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      print("body ");
      print(valueMap);
      DriverRatingResponse driverRatingResponse  = DriverRatingResponse.fromJson(valueMap);
      print(driverRatingResponse.userInfo!.driverRating);
      return driverRatingResponse.msg;

    }
    else{
      print ("failed");
    }
  }

  // //allDrivers api
  // static Future<dynamic?> allDrivers() async {
  //   final response = await http.post(
  //       Uri.parse('https://spdytowtruck.com/admin-panel/api/User/rating'),
  //       body: {
  //         "booking_id" :"1",
  //         "rating_value":"4",
  //         "user_id":"1"
  //       }
  //   );
  //   print(response.body);
  //   if(response.statusCode==200)
  //   {
  //     var valueMap = jsonDecode(response.body);
  //     print("body ");
  //     print(valueMap);
  //     DriverRatingResponse driverRatingResponse  = DriverRatingResponse.fromJson(valueMap);
  //     print(driverRatingResponse.userInfo!.driverRating);
  //     return driverRatingResponse.msg;
  //
  //   }
  //   else{
  //     print ("failed");
  //   }
  // }

}


