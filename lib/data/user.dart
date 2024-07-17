import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({
    @Default(2000) int balance,
  }) = _User;
}
