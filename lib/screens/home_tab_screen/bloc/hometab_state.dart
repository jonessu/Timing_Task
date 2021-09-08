part of 'hometab_bloc.dart';

@immutable
abstract class HometabState {}

class HometabInitial extends HometabState {}

class HometabLoadedState extends HometabState {}

class HometabLoadingState extends HometabState {}

class HometabFailureState extends HometabState {}
