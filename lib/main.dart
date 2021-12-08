// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spdycustomers/dataHandler/appData.dart';
import 'package:spdycustomers/pages/Login/welcome.dart';

import 'Widgets/colors.dart';

Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> AppData(),
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: backgroundColor(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Welcome.idScreen,
        home: Welcome(),
      ),
    );
  }
}

