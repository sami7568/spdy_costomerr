// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spdycustomers/dataHandler/app_data.dart';
import 'package:spdycustomers/pages/Login/welcome.dart';
import 'package:spdycustomers/pages/Menu/home_page.dart';
import 'package:spdycustomers/prefdata.dart';

import 'Widgets/colors.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
      create: (context) => AppData(),
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
  String siginkey = "false";
  String username = "null";

  @override
  void initState() {
    getSignin();
    super.initState();
  }

  getSignin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String signin = await pref.getString(Data.siginkey);
    String name = await pref.getString(Data.userName);
    String userid = await pref.getString(Data.userId);
    print(name);
    setState(() {
      siginkey = signin;
      username = name;
    });
    print(signin);
    print(userid);
    print(name);
    // ignore: avoid_print
    print(siginkey);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
          builder: (context, widget) {
            //add this line
            ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
          theme: ThemeData(
            textTheme: TextTheme(
              //To support the following, you need to use the first initialization method
                button: TextStyle(fontSize: 45.sp)
            ),
          ),
              debugShowCheckedModeBanner: false,
              home: siginkey == "true" ? const HomePage() : const Welcome(),
            ));
  }
}
