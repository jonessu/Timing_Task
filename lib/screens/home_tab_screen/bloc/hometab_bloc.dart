import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hometab_event.dart';
part 'hometab_state.dart';

class HometabBloc extends Bloc<HometabEvent, HometabState> {
  HometabBloc() : super(HometabInitial());

  @override
  Stream<HometabState> mapEventToState(
    HometabEvent event,
  ) async* {
    if (event is HometabInitailEvent) {
      yield HometabLoadedState();
    }
  }
}
