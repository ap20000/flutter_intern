import '../models/contact_model.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;
  ContactLoaded(this.contacts);
}

class DuplicatesFound extends ContactState {
  final List<Contact> duplicates;
  DuplicatesFound(this.duplicates);
}
