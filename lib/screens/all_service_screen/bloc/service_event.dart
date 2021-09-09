part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}

class ServiceInitailEvent extends ServiceEvent {}

class SearchInitailEvent extends ServiceEvent {}
