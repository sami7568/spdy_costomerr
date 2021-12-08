import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spdycustomers/Widgets/button.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class CurrentNoOrders extends StatefulWidget {
  @override
  _CurrentNoOrdersState createState() => _CurrentNoOrdersState();
}

class _CurrentNoOrdersState extends State<CurrentNoOrders> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 30, top: 80, right: 30),
            child: Stack(
              children: [
                Text("Current Orders", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text("You have no current orders.", style: TextStyle(fontSize: 17, color: Colors.white, )),
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
