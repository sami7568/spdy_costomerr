import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spdycustomers/pages/Login/login.dart';
import 'package:spdycustomers/pages/Registeration/acc_reg.dart';
import 'package:spdycustomers/Widgets/colors.dart';

class Welcome extends StatefulWidget {
static const String idScreen = "welcome";

  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  Color loginColor = Colors.white;
  Color registerColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor(),
          child:
          Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    SvgPicture.asset("assets/images/spdy.svg"),
                    const SizedBox(height: 50,),
                    const Text("Welcome!", style: TextStyle(fontSize: 30, color: Colors.white),),
                    const SizedBox(height: 80,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          registerColor == Colors.white ?
                          registerColor = buttonPressBlueColor():
                          registerColor = Colors.white;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AccRegistration()));
                      },
                      child: Container(
                        width: 280,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: registerColor,
                        ),
                        child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: registerColor == buttonPressBlueColor()? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          loginColor == Colors.white ?
                          loginColor = buttonPressBlueColor():
                          loginColor = Colors.white;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                      },
                      child: Container(
                        width: 280,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: loginColor,
                        ),
                        child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: loginColor == buttonPressBlueColor()? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
                const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("©SPDY Technologies, LLC", style: TextStyle(fontSize: 15, color: Colors.white),)),
              ],
            ),
          )),
    );
  }
}
