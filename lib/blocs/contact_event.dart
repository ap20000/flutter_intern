abstract class ContactEvent {}

class LoadContacts extends ContactEvent {}

class SearchPrefix extends ContactEvent {
  final String prefix;
  SearchPrefix(this.prefix);
}

class FindDuplicates extends ContactEvent {}
