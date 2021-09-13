import 'package:assessment/data/ThemeNotifier.dart';
import 'package:assessment/data/color.dart';
import 'package:assessment/screens/Setting_screen/setting_screen.dart';
import 'package:assessment/screens/authenticate_account_screen/authenticate_account_screen.dart';
import 'package:assessment/screens/biometric_screen/biometric_screen.dart';
import 'package:assessment/screens/home_tab_screen/home_tab_screen.dart';
import 'package:assessment/screens/refer_earn_screen/refer_earn_screen.dart';
import 'package:assessment/screens/splash_screen/splash_screen.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  ThemeData activeTheme = greenTheme;
  SharedPreferences.getInstance().then((pref) {
    int i = pref.getInt('themeKey') ?? 1;
    if (i == 1) {
      activeTheme = defaultTheme;
    } else if (i == 2) {
      activeTheme = blueTheme;
    } else if (i == 3) {
      activeTheme = spookyTheme;
    } else if (i == 4) {
      activeTheme = pinkTheme;
    } else {
      activeTheme = defaultTheme;
    }
    runApp(ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(activeTheme), child: MyApp()));
  });
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
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      // darkTheme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   primaryColor: ColorResources.color51063A,
      // ),
      //home: boolValue ? BiometricScreen() : SettingsScreen(),
      home: AuthenticateAccountScreen(),
    );
  }
}
