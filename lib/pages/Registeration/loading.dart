import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class LoadingReg extends StatefulWidget {
  @override
  _LoadingRegState createState() => _LoadingRegState();
}

class _LoadingRegState extends State<LoadingReg> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: backgroundColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressIndicatorDemo(),
            // DotsIndicator(
            //   dotsCount: 3,
            //   position: 1,
            //   decorator: DotsDecorator(
            //     color: Colors.black87, // Inactive color
            //     activeColor: Colors.redAccent,
            //   ),
            // ),
            SizedBox(height: 15,),

            Text(
              "creating your account...",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),

      ),

    );
  }

}


class ProgressIndicatorDemo extends StatefulWidget {

  @override
  _ProgressIndicatorDemoState createState() =>
      new _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller!)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller!.repeat();
  }


  @override
  void dispose() {
    controller!.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
          color: Colors.white,
          child:  LinearProgressIndicator(
            backgroundColor: Colors.white,
            value:  animation!.value,),

        )
    );
  }

}