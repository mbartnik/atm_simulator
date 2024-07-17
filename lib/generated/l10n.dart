// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `ATM`
  String get atm {
    return Intl.message(
      'ATM',
      name: 'atm',
      desc: '',
      args: [],
    );
  }

  /// `Balance:`
  String get balance {
    return Intl.message(
      'Balance:',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// ` PLN`
  String get currencySuffix {
    return Intl.message(
      ' PLN',
      name: 'currencySuffix',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient funds`
  String get insufficientFundsDialogTitle {
    return Intl.message(
      'Insufficient funds',
      name: 'insufficientFundsDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a number that's lower than your balance.`
  String get insufficientFundsDialogDesc {
    return Intl.message(
      'Please enter a number that\'s lower than your balance.',
      name: 'insufficientFundsDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw money`
  String get cashOut {
    return Intl.message(
      'Withdraw money',
      name: 'cashOut',
      desc: '',
      args: [],
    );
  }

  /// `Money withdrawal has been successful`
  String get cashOutSuccessfulDialogTitle {
    return Intl.message(
      'Money withdrawal has been successful',
      name: 'cashOutSuccessfulDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `You withdrew {amount} PLN in below denominations:\n`
  String cashOutSuccessfulDialogDesc(Object amount) {
    return Intl.message(
      'You withdrew $amount PLN in below denominations:\n',
      name: 'cashOutSuccessfulDialogDesc',
      desc: '',
      args: [amount],
    );
  }

  /// `Invalid number entered`
  String get invalidNumberEnteredDialogTitle {
    return Intl.message(
      'Invalid number entered',
      name: 'invalidNumberEnteredDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `ATM only have banknotes with 10 PLN being the lowest. Please enter a number equal or higher than 10 and divisible by it.`
  String get invalidNumberEnteredDialogDesc {
    return Intl.message(
      'ATM only have banknotes with 10 PLN being the lowest. Please enter a number equal or higher than 10 and divisible by it.',
      name: 'invalidNumberEnteredDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `Amount to be withdrawn`
  String get textfieldHint {
    return Intl.message(
      'Amount to be withdrawn',
      name: 'textfieldHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
