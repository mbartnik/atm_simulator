// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ATM {
  bool get isInfinite => throw _privateConstructorUsedError;
  int get countOf200BankNotes => throw _privateConstructorUsedError;
  int get countOf100BankNotes => throw _privateConstructorUsedError;
  int get countOf50BankNotes => throw _privateConstructorUsedError;
  int get countOf20BankNotes => throw _privateConstructorUsedError;
  int get countOf10BankNotes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ATMCopyWith<ATM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ATMCopyWith<$Res> {
  factory $ATMCopyWith(ATM value, $Res Function(ATM) then) =
      _$ATMCopyWithImpl<$Res, ATM>;
  @useResult
  $Res call(
      {bool isInfinite,
      int countOf200BankNotes,
      int countOf100BankNotes,
      int countOf50BankNotes,
      int countOf20BankNotes,
      int countOf10BankNotes});
}

/// @nodoc
class _$ATMCopyWithImpl<$Res, $Val extends ATM> implements $ATMCopyWith<$Res> {
  _$ATMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInfinite = null,
    Object? countOf200BankNotes = null,
    Object? countOf100BankNotes = null,
    Object? countOf50BankNotes = null,
    Object? countOf20BankNotes = null,
    Object? countOf10BankNotes = null,
  }) {
    return _then(_value.copyWith(
      isInfinite: null == isInfinite
          ? _value.isInfinite
          : isInfinite // ignore: cast_nullable_to_non_nullable
              as bool,
      countOf200BankNotes: null == countOf200BankNotes
          ? _value.countOf200BankNotes
          : countOf200BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf100BankNotes: null == countOf100BankNotes
          ? _value.countOf100BankNotes
          : countOf100BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf50BankNotes: null == countOf50BankNotes
          ? _value.countOf50BankNotes
          : countOf50BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf20BankNotes: null == countOf20BankNotes
          ? _value.countOf20BankNotes
          : countOf20BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf10BankNotes: null == countOf10BankNotes
          ? _value.countOf10BankNotes
          : countOf10BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ATMImplCopyWith<$Res> implements $ATMCopyWith<$Res> {
  factory _$$ATMImplCopyWith(_$ATMImpl value, $Res Function(_$ATMImpl) then) =
      __$$ATMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInfinite,
      int countOf200BankNotes,
      int countOf100BankNotes,
      int countOf50BankNotes,
      int countOf20BankNotes,
      int countOf10BankNotes});
}

/// @nodoc
class __$$ATMImplCopyWithImpl<$Res> extends _$ATMCopyWithImpl<$Res, _$ATMImpl>
    implements _$$ATMImplCopyWith<$Res> {
  __$$ATMImplCopyWithImpl(_$ATMImpl _value, $Res Function(_$ATMImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInfinite = null,
    Object? countOf200BankNotes = null,
    Object? countOf100BankNotes = null,
    Object? countOf50BankNotes = null,
    Object? countOf20BankNotes = null,
    Object? countOf10BankNotes = null,
  }) {
    return _then(_$ATMImpl(
      isInfinite: null == isInfinite
          ? _value.isInfinite
          : isInfinite // ignore: cast_nullable_to_non_nullable
              as bool,
      countOf200BankNotes: null == countOf200BankNotes
          ? _value.countOf200BankNotes
          : countOf200BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf100BankNotes: null == countOf100BankNotes
          ? _value.countOf100BankNotes
          : countOf100BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf50BankNotes: null == countOf50BankNotes
          ? _value.countOf50BankNotes
          : countOf50BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf20BankNotes: null == countOf20BankNotes
          ? _value.countOf20BankNotes
          : countOf20BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
      countOf10BankNotes: null == countOf10BankNotes
          ? _value.countOf10BankNotes
          : countOf10BankNotes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ATMImpl implements _ATM {
  const _$ATMImpl(
      {required this.isInfinite,
      this.countOf200BankNotes = 10,
      this.countOf100BankNotes = 10,
      this.countOf50BankNotes = 10,
      this.countOf20BankNotes = 10,
      this.countOf10BankNotes = 10});

  @override
  final bool isInfinite;
  @override
  @JsonKey()
  final int countOf200BankNotes;
  @override
  @JsonKey()
  final int countOf100BankNotes;
  @override
  @JsonKey()
  final int countOf50BankNotes;
  @override
  @JsonKey()
  final int countOf20BankNotes;
  @override
  @JsonKey()
  final int countOf10BankNotes;

  @override
  String toString() {
    return 'ATM(isInfinite: $isInfinite, countOf200BankNotes: $countOf200BankNotes, countOf100BankNotes: $countOf100BankNotes, countOf50BankNotes: $countOf50BankNotes, countOf20BankNotes: $countOf20BankNotes, countOf10BankNotes: $countOf10BankNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ATMImpl &&
            (identical(other.isInfinite, isInfinite) ||
                other.isInfinite == isInfinite) &&
            (identical(other.countOf200BankNotes, countOf200BankNotes) ||
                other.countOf200BankNotes == countOf200BankNotes) &&
            (identical(other.countOf100BankNotes, countOf100BankNotes) ||
                other.countOf100BankNotes == countOf100BankNotes) &&
            (identical(other.countOf50BankNotes, countOf50BankNotes) ||
                other.countOf50BankNotes == countOf50BankNotes) &&
            (identical(other.countOf20BankNotes, countOf20BankNotes) ||
                other.countOf20BankNotes == countOf20BankNotes) &&
            (identical(other.countOf10BankNotes, countOf10BankNotes) ||
                other.countOf10BankNotes == countOf10BankNotes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInfinite,
      countOf200BankNotes,
      countOf100BankNotes,
      countOf50BankNotes,
      countOf20BankNotes,
      countOf10BankNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ATMImplCopyWith<_$ATMImpl> get copyWith =>
      __$$ATMImplCopyWithImpl<_$ATMImpl>(this, _$identity);
}

abstract class _ATM implements ATM {
  const factory _ATM(
      {required final bool isInfinite,
      final int countOf200BankNotes,
      final int countOf100BankNotes,
      final int countOf50BankNotes,
      final int countOf20BankNotes,
      final int countOf10BankNotes}) = _$ATMImpl;

  @override
  bool get isInfinite;
  @override
  int get countOf200BankNotes;
  @override
  int get countOf100BankNotes;
  @override
  int get countOf50BankNotes;
  @override
  int get countOf20BankNotes;
  @override
  int get countOf10BankNotes;
  @override
  @JsonKey(ignore: true)
  _$$ATMImplCopyWith<_$ATMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
