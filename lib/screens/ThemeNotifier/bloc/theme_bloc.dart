import 'dart:async';

import 'package:assessment/data/color.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial());
  ThemeData activeTheme = blueTheme;

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ClickThemeChange) {
      this.activeTheme = blueTheme;
      print(activeTheme.primaryColor);
    }
  }
}
