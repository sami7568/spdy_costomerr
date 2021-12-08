// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:spdycustomer/pages/AccountSetting/accountSettings.dart';
// import 'package:spdycustomer/pages/Registeration/acc_reg.dart';
// import 'package:spdycustomer/Widgets/colors.dart';
//
// class Select_reg extends StatefulWidget {
//
//   @override
//   _Select_regState createState() => _Select_regState();
// }
//
// class _Select_regState extends State<Select_reg> {
//
//   Color customerColor = Colors.white;
//   Color providerColor = Colors.white;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           color: backgroundColor(),
//           child:
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//
//
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         customerColor == Colors.white ?
//                         customerColor = buttonPressBlueColor():
//                         customerColor = Colors.white;
//                       });
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Acc_reg()
//
//                       ));
//                     },
//                     child: Container(
//                       width: 280,
//                       height: 60,
//
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50.0),
//                           color: customerColor
//                       ),
//                       child: Center(
//                           child: Text(
//                             "Register as Customer",
//                             style: TextStyle(
//                                 color: customerColor == buttonPressBlueColor()? Colors.white : Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20),
//                           )),
//                     ),
//                   ),
//                   SizedBox(height: 30,),
//                   Container(
//                     width: 280,
//                     height: 60,
//
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50.0),
//                         color: Colors.white,
//                     ),
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSetting()));
//                       },
//                       child: Center(
//                           child: Text(
//                             "Register as Povider",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Icon(
//                         Icons.cancel,
//                         color: Colors.white,
//                         size: 50,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Cancel",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
