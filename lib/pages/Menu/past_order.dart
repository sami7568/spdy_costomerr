import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/Model/JsonData/user_booking_list_response.dart';
import 'package:spdycustomers/assistant/api_services.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/pages/Menu/history.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class PastOrders extends StatefulWidget {
  const PastOrders({Key? key}) : super(key: key);
  @override
  _PastOrdersState createState() => _PastOrdersState();
}

class _PastOrdersState extends State<PastOrders> {
  bool selected = false;
List<Bookings>? pastBookings;
  String?  data="0";
  @override
  void initState() {
    getCurrentOrder();
    super.initState();
  }
  getCurrentOrder()async{
    String? userId = Provider.of<AppData>(context,listen: false).uId;
    String? bookingStatus = "Completed";
    UserBookingListResponse? bookingResponse = await ApiServices.userBookingList(bookingStatus,userId);
    if(bookingResponse == null){
      print("noData");
      setState(() {
        data = "no";
      });
    }else{
    if(bookingResponse.bookings!.isEmpty){
      print("empty");
    }
    else{
    setState(() {
    data  = bookingResponse.bookings!.first.service;
    });
    List<Bookings> bookings = bookingResponse.bookings!;
    setState(() {
      pastBookings = bookings;
    });
    }
  }}

  @override
  Widget build(BuildContext context) {
    return body();
  }
  body(){
    return  Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding:
            const EdgeInsets.only(bottom: 20, left: 30, top: 80, right: 30),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text("Past Orders",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                data=="0"
                  ? progressIndicator()
                  : data=="no"
                     ? noData()
                     : bookings(),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Menu",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
            ),
          )),
    );
  }
  bookings(){
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const History()));
            // ignore: avoid_print
            print("records");
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              return cardss();
            },
            itemCount: pastBookings!.length,)
        /*child: ListView(
                                    children: <Widget>[
                                  cardss(),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: buttonPressBlueColor(), width: 2),
                                        borderRadius: BorderRadius.circular(4.0)),
                                    child: ListTile(
                                      title: Text("XYZ Roadside",
                                          style: TextStyle(
                                              color: buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text('#ABC-123',
                                          style: TextStyle(color: buttonPressBlueColor())),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        // space between two icons
                                        children: <Widget>[
                                          Text("\$22.21",
                                              style: TextStyle(
                                                  color: buttonPressBlueColor(),
                                                  fontWeight: FontWeight.bold)), // icon-1
                                          Text('Completed on 05/29/2021',
                                              style:
                                              TextStyle(color: buttonPressBlueColor())),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: buttonPressBlueColor(), width: 2),
                                        borderRadius: BorderRadius.circular(4.0)),
                                    child: ListTile(
                                      title: Text("AAA Towning",
                                          style: TextStyle(
                                              color: buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text('#ABC-123',
                                          style: TextStyle(color: buttonPressBlueColor())),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        // space between two icons
                                        children: <Widget>[
                                          Text("\$55.99",
                                              style: TextStyle(
                                                  color: buttonPressBlueColor(),
                                                  fontWeight: FontWeight.bold)), // icon-1
                                          Text('Completed on 10/15/2020',
                                              style:
                                              TextStyle(color: buttonPressBlueColor())),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: buttonPressBlueColor(), width: 2),
                                        borderRadius: BorderRadius.circular(4.0)),
                                    child: ListTile(
                                      title: Text("DEF Roadside",
                                          style: TextStyle(
                                              color: buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text('#ABC-123',
                                          style: TextStyle(color: buttonPressBlueColor())),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        // space between two icons
                                        children: <Widget>[
                                          Text("\$22.21",
                                              style: TextStyle(
                                                  color: buttonPressBlueColor(),
                                                  fontWeight: FontWeight.bold)), // icon-1
                                          Text('Completed on 09/29/2020',
                                              style:
                                              TextStyle(color: buttonPressBlueColor())),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: buttonPressBlueColor(), width: 2),
                                        borderRadius: BorderRadius.circular(4.0)),
                                    child: ListTile(
                                      title: Text("BBB Towning",
                                          style: TextStyle(
                                              color: buttonPressBlueColor(),
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text('#ABC-123',
                                          style: TextStyle(color: buttonPressBlueColor())),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        // space between two icons
                                        children: <Widget>[
                                          Text("\$22.21",
                                              style: TextStyle(
                                                  color: buttonPressBlueColor(),
                                                  fontWeight: FontWeight.bold)), // icon-1
                                          Text('Completed on 09/29/2020',
                                              style:
                                              TextStyle(color: buttonPressBlueColor())),
                                        ],
                                      ),
                                    ),
                                  ),
                                  arrows(),
                                ]),*/
      ),
    );
  }
  noData(){
    return                 const Padding(
      padding: EdgeInsets.only(top: 50),
      child: Text("You have no past orders.", style: TextStyle(fontSize: 17, color: Colors.white, )),
    )
    ;
  }
  progressIndicator(){
    return                 const  Center(child:CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),))
    ;
  }
  cardss(){
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: buttonPressBlueColor(), width: 2),
          borderRadius: BorderRadius.circular(4.0)),
      child: ListTile(
        title: Text("ABC Towning",
            style: TextStyle(
                color: buttonPressBlueColor(),
                fontWeight: FontWeight.bold)),
        subtitle: Text('#ABC-123',
            style: TextStyle(color: buttonPressBlueColor())),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          // space between two icons
          children: <Widget>[
            Text("\$55.99",
                style: TextStyle(
                    color: buttonPressBlueColor(),
                    fontWeight: FontWeight.bold)), // icon-1
            Text('Completed on 06/01/2021',
                style:
                TextStyle(color: buttonPressBlueColor())),
          ],
        ),
      ),
    );
  }
  arrows(){
    return Row(
      // mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          child: Row(
            children: const [
              Icon(
                Icons.navigate_before,
                color: Colors.white,
                size: 40,
              ),
              Icon(
                Icons.navigate_before,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
          onPressed: () {
            // _controller.previousPage(
            //     duration: _kDuration, curve: _kCurve);
          },
        ),
        const Text(
          "Page 1 of 10",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        // ignore: deprecated_member_use
        FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 40,
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
          onPressed: () {
            // _controller.nextPage(duration: _kDuration, curve: _kCurve);
          },
        )
      ],
    );
  }
  menuButton() async {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Menu",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
