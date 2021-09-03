import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'referearn_event.dart';
part 'referearn_state.dart';

class ReferearnBloc extends Bloc<ReferearnEvent, ReferearnState> {
  ReferearnBloc() : super(ReferearnInitial());
  List<Contact> foundUsers = [];

  @override
  Stream<ReferearnState> mapEventToState(
    ReferearnEvent event,
  ) async* {
    if (event is ReferearnInitailEvent) {
      if (await Permission.contacts.request().isGranted) {
        List<Contact> contact =
            (await ContactsService.getContacts(withThumbnails: false)).toList();
        foundUsers = contact;
        print(foundUsers[1].displayName);
      }
      yield ReferearnLoadedState();
    }
    if (event is SearchInitailEvent) {
      if (await Permission.contacts.request().isGranted) {
        List<Contact> contact =
            (await ContactsService.getContacts(withThumbnails: false)).toList();
        foundUsers = contact;
        print(foundUsers[1].displayName);
      }
      yield SearchLoadedState();
    }
  }
}
