import 'package:bankomat/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'atm_notifier.g.dart';

@Riverpod(keepAlive: true)
class AtmNotifier extends _$AtmNotifier {
  @override
  Map<int, int> build() {
    state = Map.fromIterable(denominations, value: (element) => 10);
    return state;
  }

  Map<int, int> calculateBanknotesCount(int amount) {
    Map<int, int> banknotesCount = Map.fromIterable(denominations, value: (element) => 0);
    final atmBalance = state.entries.fold(0, (previousValue, element) => previousValue + element.key * element.value);
    if (amount > atmBalance) {
      throw InsufficientAtmFundsException();
    }
    for (int denomination in denominations) {
      final requiredCount = amount ~/ denomination;
      if (requiredCount <= state[denomination]!) {
        banknotesCount[denomination] = requiredCount;
        amount %= denomination;
        state[denomination] = state[denomination]! - requiredCount;
      } else {
        banknotesCount[denomination] = state[denomination]!;
        amount -= state[denomination]! * denomination;
        state[denomination] = 0;
      }
    }
    return banknotesCount;
  }
}

class InsufficientAtmFundsException implements Exception {}
