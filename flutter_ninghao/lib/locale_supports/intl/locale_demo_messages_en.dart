// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(name) => "hello ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "greet" : m0,
    "tabbar_demos" : MessageLookupByLibrary.simpleMessage("Demos"),
    "tabbar_explore" : MessageLookupByLibrary.simpleMessage("Explore"),
    "tabbar_history" : MessageLookupByLibrary.simpleMessage("History"),
    "tabbar_home" : MessageLookupByLibrary.simpleMessage("Home"),
    "title" : MessageLookupByLibrary.simpleMessage("hello")
  };
}
