import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({
    @Default(5000) int balance,
  }) = _User;
}
