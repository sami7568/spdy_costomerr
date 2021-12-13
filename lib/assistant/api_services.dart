import 'package:http/http.dart' as http;
import 'package:spdycustomers/Model/JsonData/add_credit_card_response.dart';
import 'package:spdycustomers/Model/JsonData/booking_response.dart';
import 'package:spdycustomers/Model/JsonData/delete_credit_card_respnse.dart';
import 'package:spdycustomers/Model/JsonData/driver_rating_response.dart';
import 'package:spdycustomers/Model/JsonData/edit_credit_card_response.dart';
import 'package:spdycustomers/Model/JsonData/login_response.dart';
import 'package:spdycustomers/Model/JsonData/password_update_response.dart';
import 'package:spdycustomers/Model/JsonData/signout_response.dart';
import 'dart:convert';
import 'package:spdycustomers/Model/JsonData/signup_response.dart';
import 'package:spdycustomers/Model/JsonData/user_booking_list_response.dart';
import 'package:spdycustomers/Model/JsonData/user_credit_card_response.dart';
import 'package:spdycustomers/Model/JsonData/user_data_response.dart';
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
        // ignore: avoid_print
        print("post done");
        // ignore: avoid_print
        print(response.body);
        final values = json.decode(response.body);
        SignupResponse signupResponse = SignupResponse.fromJson(values);
        // ignore: avoid_print
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
  static Future<LoginResponse> loginUser(String phoneNumber, String password) async {
    LoginResponse? loginResponse;
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/signin'),
      body: {
          "phone_number":phoneNumber,
          "password":password,
      },
    );

      if (response.statusCode == 200) {
        var valueMap = json.decode(response.body);
        // ignore: avoid_print
        print("body ");
        // ignore: avoid_print
        print(valueMap);
        loginResponse = LoginResponse.fromJson(valueMap);
        if (loginResponse.status == 200) {
          return loginResponse;
        }
        else {
          return loginResponse;
        }
      }
      else {
        // ignore: null_check_always_fails
        return loginResponse = null!;
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
        // ignore: avoid_print
        print(response.body);
        var valueMap = json.decode(response.body);
        // ignore: avoid_print
        print("body ");
        BookingResponse bookingResponse = BookingResponse.fromJson(valueMap);
        // ignore: avoid_print
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
    // ignore: avoid_print
    print(response.body);
      if(response.statusCode==200)
      {
        var valueMap = jsonDecode(response.body);
        // ignore: avoid_print
        print("body ");
        // ignore: avoid_print
        print(valueMap);
        UserDataResponse userDataResponse = UserDataResponse.fromJson(valueMap);
        // ignore: avoid_print
        print("user data response user info");
        // ignore: avoid_print
        print(userDataResponse.userInfo!.userName);
        return userDataResponse.msg;
      }
      else{
        // ignore: avoid_print
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
    // ignore: avoid_print
    print(response.statusCode);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
    }
    else{
      // ignore: avoid_print
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
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
      SignoutResponse userDataResponse = SignoutResponse.fromJson(valueMap);
      // ignore: avoid_print
      print("signout res");
      // ignore: avoid_print
      print(userDataResponse.msg);
      return userDataResponse.msg;
    }
    else{
      // ignore: avoid_print
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
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
      PasswordUpdateResponse passwordUpdateResponse = PasswordUpdateResponse.fromJson(valueMap);
       // ignore: avoid_print
       print("password update res");
       // ignore: avoid_print
       print(passwordUpdateResponse.msg);
      // return userDataResponse.msg;
    }
    else{
      // ignore: avoid_print
      print ("failed");
    }
  }

  //add_credit_card
  // ignore: unnecessary_question_mark
  static Future<dynamic?> addCreditCard(String? userId,String? userName, String? cardNumber, String? expiration,String? digitNumber) async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/add_credit_card'),
        body: {
          "user_id" :userId,
          "card_name":userName,
          "card_number":cardNumber,
          "expiration":expiration,
          "digit_number":digitNumber,
        }
    );
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
      AddCreditCardResponse addCreditCardResponse = AddCreditCardResponse.fromJson(valueMap);
      // ignore: avoid_print
      print(addCreditCardResponse.cardInfo!.userId);
      return addCreditCardResponse.status;
      }
    else{
      // ignore: avoid_print
      print ("failed");
    }
  }

  //user_credit_card
  static Future<dynamic> userCreditCards() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/user_credit_cards'),
        body: {
          "user_id" :"33",
        }
    );
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
      UserCreditCardResponse userCreditCardResponse = UserCreditCardResponse.fromJson(valueMap);
      for (var element in userCreditCardResponse.cards!) {
        // ignore: avoid_print
        print("reg date");
        // ignore: avoid_print
        print(element.regDate);
      }
      for (var element in userCreditCardResponse.userInfo!.cards!) {
        // ignore: avoid_print
        print(element.regDate);
      }
      return userCreditCardResponse.status;
    }
    else{
      // ignore: avoid_print
      print ("failed");
    }
  }

  //update_credit_card
  // ignore: unnecessary_question_mark
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
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
      EditCreditCardResponse editCreditCardResponse = EditCreditCardResponse.fromJson(valueMap);
      // ignore: avoid_print
      print(editCreditCardResponse.userInfo!.cardName);
      return editCreditCardResponse.status;
    }
    else{
      // ignore: avoid_print
      print ("failed");
    }
  }

  //update_credit_card
  static Future<dynamic> deleteCreditCard() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/delete_creditcard'),
        body: {
          "user_id" :"33",
          "_id":"1",
        }
    );
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
      DeleteCreditCardResponse deleteCreditCardResponse = DeleteCreditCardResponse.fromJson(valueMap);
      // ignore: avoid_print
      print(deleteCreditCardResponse.msg);
      return deleteCreditCardResponse.status;
    }
    else{
      // ignore: avoid_print
      print ("failed");
    }
  }

  //user_booking_list specific
  // ignore: unnecessary_question_mark
  static Future<dynamic?> userBookingList() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/user_booking_list'),
        body: {
          "user_id" : "1",
          "booking_status"  : "Completed",
        }
    );
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      // ignore: avoid_print
      print("ok");
     var valueMap = jsonDecode(response.body);
     // ignore: avoid_print
     print("body ");
     // ignore: avoid_print
     print(valueMap);
     UserBookingListResponse userBookingListResponse = UserBookingListResponse.fromJson(valueMap);
     // ignore: avoid_print
     print(userBookingListResponse.bookings!.first);
     for (var value in userBookingListResponse.bookings!) {
       // ignore: avoid_print
       print(value.driverRating);
     }
     return userBookingListResponse.msg;
    }
    else{
      // ignore: avoid_print
      print ("failed");
    }
  }

  //ratiing api
  static Future<dynamic> rating() async {
    final response = await http.post(
        Uri.parse('https://spdytowtruck.com/admin-panel/api/User/rating'),
        body: {
          "booking_id" :"1",
          "rating_value":"4",
          "user_id":"1"
        }
    );
    // ignore: avoid_print
    print(response.body);
    if(response.statusCode==200)
    {
      var valueMap = jsonDecode(response.body);
      // ignore: avoid_print
      print("body ");
      // ignore: avoid_print
      print(valueMap);
      DriverRatingResponse driverRatingResponse  = DriverRatingResponse.fromJson(valueMap);
      // ignore: avoid_print
      print(driverRatingResponse.userInfo!.driverRating);
      return driverRatingResponse.msg;

    }
    else{
      // ignore: avoid_print
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


