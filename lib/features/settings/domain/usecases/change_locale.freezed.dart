// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocaleParams {
  String get languageCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocaleParamsCopyWith<LocaleParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleParamsCopyWith<$Res> {
  factory $LocaleParamsCopyWith(
          LocaleParams value, $Res Function(LocaleParams) then) =
      _$LocaleParamsCopyWithImpl<$Res, LocaleParams>;
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class _$LocaleParamsCopyWithImpl<$Res, $Val extends LocaleParams>
    implements $LocaleParamsCopyWith<$Res> {
  _$LocaleParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocaleParamsCopyWith<$Res>
    implements $LocaleParamsCopyWith<$Res> {
  factory _$$_LocaleParamsCopyWith(
          _$_LocaleParams value, $Res Function(_$_LocaleParams) then) =
      __$$_LocaleParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String languageCode});
}

/// @nodoc
class __$$_LocaleParamsCopyWithImpl<$Res>
    extends _$LocaleParamsCopyWithImpl<$Res, _$_LocaleParams>
    implements _$$_LocaleParamsCopyWith<$Res> {
  __$$_LocaleParamsCopyWithImpl(
      _$_LocaleParams _value, $Res Function(_$_LocaleParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_$_LocaleParams(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocaleParams implements _LocaleParams {
  const _$_LocaleParams({required this.languageCode});

  @override
  final String languageCode;

  @override
  String toString() {
    return 'LocaleParams(languageCode: $languageCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocaleParams &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocaleParamsCopyWith<_$_LocaleParams> get copyWith =>
      __$$_LocaleParamsCopyWithImpl<_$_LocaleParams>(this, _$identity);
}

abstract class _LocaleParams implements LocaleParams {
  const factory _LocaleParams({required final String languageCode}) =
      _$_LocaleParams;

  @override
  String get languageCode;
  @override
  @JsonKey(ignore: true)
  _$$_LocaleParamsCopyWith<_$_LocaleParams> get copyWith =>
      throw _privateConstructorUsedError;
}
