import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc() : super(ServiceInitial());

  @override
  Stream<ServiceState> mapEventToState(
    ServiceEvent event,
  ) async* {
    if (event is ServiceInitailEvent) {
      yield ServiceLoadedState();
    } else if (event is SearchInitailEvent) {
      yield SearchLoadedState();
    }
  }
}
