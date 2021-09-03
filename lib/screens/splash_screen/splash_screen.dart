import 'dart:async';

import 'package:assessment/screens/Setting_screen/setting_screen.dart';
import 'package:assessment/screens/biometric_screen/biometric_screen.dart';
import 'package:assessment/screens/splash_screen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    splashBloc = SplashBloc()..add(SplashIntial());
    Timer(
      Duration(seconds: 3),
      () => {
        if (splashBloc.boolScreenValue == true)
          {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BiometricScreen()))
          }
        else
          {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SettingsScreen()))
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: splashBloc,
      listener: (context, state) {
        if (state is SplashNavigate) {
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => ()));
        }
      },
      child: BlocBuilder(
        bloc: splashBloc,
        builder: (context, state) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        },
      ),
    );
  }
}
