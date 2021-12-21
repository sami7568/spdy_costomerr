// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/pages/Login/welcome.dart';
import 'package:spdycustomers/pages/Menu/home_page.dart';
import 'package:spdycustomers/prefdata.dart';

import 'Widgets/colors.dart';

Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
  ));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      const MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
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
        //initialRoute:singkey==true? HomePage() :Welcome.idScreen,
        // ignore: unrelated_type_equality_checks
        home: const App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  String siginkey="false";
  @override
  void initState() {
    getSignin();
    super.initState();
  }
  getSignin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
   String a = await pref.getString(Data.siginkey);
   siginkey = a;
    print(a);
    // ignore: avoid_print
    print(siginkey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: /*siginkey == "true" ? */ const Welcome() /*: Welcome()*/,
    );
  }

}
