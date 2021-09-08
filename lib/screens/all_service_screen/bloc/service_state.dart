part of 'service_bloc.dart';

@immutable
abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class ServiceLoadedState extends ServiceState {}

class ServiceLoadingState extends ServiceState {}

class ServiceFailureState extends ServiceState {}
