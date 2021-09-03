import 'package:assessment/screens/Setting_screen/setting_screen.dart';
import 'package:assessment/screens/biometric_screen/biometric_screen.dart';
import 'package:assessment/screens/refer_earn_screen/refer_earn_screen.dart';
import 'package:assessment/screens/splash_screen/splash_screen.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool boolValue = false;
  @override
  void initState() {
    super.initState();
    checkFingerPrint();
  }

  void checkFingerPrint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      boolValue = prefs.getBool('fingerAuth') ?? false;
    });
    print("FingerPrint Value is : " + boolValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: ColorResources.color641653,
      ),
      //home: boolValue ? BiometricScreen() : SettingsScreen(),
      home: SplashScreen(),
    );
  }
}
