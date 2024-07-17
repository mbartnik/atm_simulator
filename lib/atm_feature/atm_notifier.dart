import 'package:bankomat/atm_feature/user_notifier.dart';
import 'package:bankomat/constants.dart';
import 'package:bankomat/data/atm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AtmNotifier extends Notifier<ATM> {
  @override
  ATM build() {
    state = const ATM(isInfinite: true);
    return state;
  }

  Map<int, int> calculateBanknotesCount(int amount) {
    Map<int, int> banknotesCount = Map.fromIterable(denominations, value: (element) => 0);
    for (int denomination in denominations) {
      banknotesCount[denomination] = amount ~/ denomination;
      amount %= denomination;
    }
    return banknotesCount;
  }
}

final atmProvider = NotifierProvider<AtmNotifier, ATM>(AtmNotifier.new);
