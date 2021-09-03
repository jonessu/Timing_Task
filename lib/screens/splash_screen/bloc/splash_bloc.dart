import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());
  bool boolScreenValue = false;

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is SplashIntial) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      this.boolScreenValue = prefs.getBool('fingerAuth') ?? false;
      await Future.delayed(Duration(seconds: 3));
      print(boolScreenValue);
      yield SplashNavigate();
    }
  }
}
