part of 'referearn_bloc.dart';

@immutable
abstract class ReferearnState {}

class ReferearnInitial extends ReferearnState {}

class ReferearnLoadedState extends ReferearnState {}

class ReferearnLoadingState extends ReferearnState {}

class ReferearnFailureState extends ReferearnState {}

class SearchLoadedState extends ReferearnState {}

class SearchLoadingState extends ReferearnState {}

class SearchFailureState extends ReferearnState {}
