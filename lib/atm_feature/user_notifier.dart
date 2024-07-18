import 'package:bankomat/atm_feature/atm_notifier.dart';
import 'package:bankomat/data/user.dart';
import 'package:bankomat/generated/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
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
      try {
        final banknotesCount = ref.read(atmNotifierProvider.notifier).calculateBanknotesCount(amount);
        state = state.copyWith(balance: state.balance - amount);
        onSuccessfulCashOut(banknotesCount);
      } on InsufficientAtmFundsException {
        onError(S.current.insufficientAtmFundsDialogTitle, S.current.insufficientAtmFundsDialogDesc);
      }
    } else {
      onError(S.current.insufficientFundsDialogTitle, S.current.insufficientFundsDialogDesc);
    }
  }
}
