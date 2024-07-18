// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl_PL locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl_PL';

  static String m0(amount) =>
      "Wypłacono ${amount} PLN w następujących banknotach:\n";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "atm": MessageLookupByLibrary.simpleMessage("Bankomat"),
        "balance": MessageLookupByLibrary.simpleMessage("Saldo:"),
        "cashOut": MessageLookupByLibrary.simpleMessage("Wypłać"),
        "cashOutSuccessfulDialogDesc": m0,
        "cashOutSuccessfulDialogTitle":
            MessageLookupByLibrary.simpleMessage("Pieniądze zostały wypłacone"),
        "currencySuffix": MessageLookupByLibrary.simpleMessage(" PLN"),
        "insufficientAtmFundsDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Brak wystarczających środków w bankomacie. Przepraszamy za niedogodności."),
        "insufficientAtmFundsDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Niewystarczające środki w bankomacie"),
        "insufficientFundsDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Wprowadź kwotę mniejszą niż Twoje saldo."),
        "insufficientFundsDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Niewystarczające środki na koncie"),
        "invalidNumberEnteredDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Bankomat wydaje tylko banknoty, gdzie najniższy to 10 PLN. Proszę podać kwotę równą lub większą niż 10 i podzielną przez 10."),
        "invalidNumberEnteredDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Wprowadzono nieprawidłową kwotę"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "textfieldHint":
            MessageLookupByLibrary.simpleMessage("Kwota do wypłaty")
      };
}
