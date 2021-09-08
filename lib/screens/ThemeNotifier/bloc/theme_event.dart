part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeIntial extends ThemeEvent {}

class ClickThemeChange extends ThemeEvent {
  final String activeColorDemo;
  ClickThemeChange(this.activeColorDemo);
}
