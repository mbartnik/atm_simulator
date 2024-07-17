import 'dart:ui';

import 'package:bankomat/atm_feature/atm_notifier.dart';
import 'package:bankomat/data/user.dart';
import 'package:bankomat/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends Notifier<User> {
  @override
  User build() {
    state = const User();
    return state;
  }

  void cashOut(int amount, Function(String title, String description) onError,
      Function(Map<int, int> banknotesCount) onSuccessfulCashOut) {
    if (amount % 10 != 0) {
      onError(S.current.invalidNumberEnteredDialogTitle, S.current.invalidNumberEnteredDialogDesc);
    } else if (state.balance >= amount) {
      state = state.copyWith(balance: state.balance - amount);
      onSuccessfulCashOut(ref.read(atmProvider.notifier).calculateBanknotesCount(amount));
    } else {
      onError(S.current.insufficientFundsDialogTitle, S.current.insufficientFundsDialogDesc);
    }
  }
}

final userProvider = NotifierProvider<UserNotifier, User>(UserNotifier.new);
