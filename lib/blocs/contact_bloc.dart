import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/contact_model.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<Contact> _contacts = [];

  ContactBloc() : super(ContactInitial()) {
    on<LoadContacts>((event, emit) async {
      emit(ContactLoading());
      final data = await rootBundle.loadString('assets/contacts.json');
      final List<dynamic> jsonData = json.decode(data);
      _contacts = jsonData.map((e) => Contact.fromJson(e)).toList();
      emit(ContactLoaded(_contacts));
    });

    on<FindDuplicates>((event, emit) {
      emit(ContactLoading());
      final Map<String, List<Contact>> grouped = {};
      for (var c in _contacts) {
        final key = c.name;
        grouped.putIfAbsent(key, () => []).add(c);
      }
      final duplicates =
          grouped.values
              .where((list) => list.length > 1)
              .expand((x) => x)
              .toList();
      emit(DuplicatesFound(duplicates));
    });
  }
}
