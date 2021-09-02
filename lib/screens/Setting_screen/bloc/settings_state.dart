part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoadedState extends SettingsState {}

class SettingsLoadingState extends SettingsState {}

class SettingsFailureState extends SettingsState {}
