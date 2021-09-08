part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoadedState extends AccountState {}

class AccountLoadingState extends AccountState {}

class AccountFailureState extends AccountState {}
