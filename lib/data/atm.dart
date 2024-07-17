import 'package:freezed_annotation/freezed_annotation.dart';
part 'atm.freezed.dart';

@freezed
sealed class ATM with _$ATM {
  const factory ATM({
    required bool isInfinite,
    @Default(10) int countOf200BankNotes,
    @Default(10) int countOf100BankNotes,
    @Default(10) int countOf50BankNotes,
    @Default(10) int countOf20BankNotes,
    @Default(10) int countOf10BankNotes,
  }) = _ATM;
}
