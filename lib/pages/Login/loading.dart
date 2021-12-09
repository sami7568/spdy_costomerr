import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class LoadingLogin extends StatefulWidget {
  const LoadingLogin({Key? key}) : super(key: key);

  @override
  _LoadingLoginState createState() => _LoadingLoginState();
}

class _LoadingLoginState extends State<LoadingLogin> {

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
            children: const [
             // ProgressIndicatorDemo(),
               DotsIndicator(
                 dotsCount: 3,
                 position: 0,
                 reversed: true,
                 decorator: DotsDecorator(
                   color: Colors.white, // Inactive color
                   activeColor: Color(0xffD6A7FF),
                 ),
               ),
              SizedBox(height: 15,),
              Text(
                "Logging in to your account...",
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

/*

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
            color: Colors.white,
            value:  animation!.value,),

        )
    );
  }

}
*/
