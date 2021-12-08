import 'package:flutter/material.dart';
import 'package:spdycustomers/pages/Menu/history.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class PastOrders extends StatefulWidget {
  @override
  _PastOrdersState createState() => _PastOrdersState();
}

class _PastOrdersState extends State<PastOrders> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 20, left: 30, top: 80, right: 30),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text("Past Orders",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => History()));
                      print("records");

                    },
                    child: ListView(children: <Widget>[
                      Card(
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
                      ),
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
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            child: Row(
                              children: [
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
                          Text(
                            "Page 1 of 10",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          FlatButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                      ),
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
}
