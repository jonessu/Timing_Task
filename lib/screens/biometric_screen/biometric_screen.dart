import 'dart:async';
import 'package:assessment/screens/Setting_screen/setting_screen.dart';
import 'package:assessment/screens/biometric_screen/bloc/biometric_bloc.dart';
import 'package:assessment/screens/home_tab_screen/home_tab_screen.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';

class BiometricScreen extends StatefulWidget {
  @override
  _BiometricScreenState createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  late BiometricBloc biometricBloc;
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    biometricBloc = BiometricBloc()..add(BiometricInitialEvent());
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: StringResource.ScanYourFingerprinttoautheticate,
        useErrorDialogs: true,
        stickyAuth: true,
      );
      if (authenticated == true) {
        Fluttertoast.showToast(
          msg: StringResource.BiometricAuthenticationSuccessfully,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Timer(Duration(seconds: 2), () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HometabScreen()));
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BiometricBloc, BiometricState>(
      bloc: biometricBloc,
      listener: (context, state) {},
      child: BlocBuilder<BiometricBloc, BiometricState>(
        bloc: biometricBloc,
        builder: (context, state) {
          if (state is BiometricLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is BiometricLoadedState) {
            return Scaffold(
              body: Center(
                child: GestureDetector(
                  onTap: authenticate,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: ColorResources.color222222,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
