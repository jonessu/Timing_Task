import 'package:assessment/screens/Setting_screen/setting_screen.dart';
import 'package:assessment/screens/refer_earn_screen/refer_earn_screen.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: ColorResources.color641653,
      ),
      home: SettingsScreen(),
    );
  }
}
