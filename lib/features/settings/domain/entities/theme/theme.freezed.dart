// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Theme {
  ActiveTheme get themeMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeCopyWith<Theme> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeCopyWith<$Res> {
  factory $ThemeCopyWith(Theme value, $Res Function(Theme) then) =
      _$ThemeCopyWithImpl<$Res, Theme>;
  @useResult
  $Res call({ActiveTheme themeMode});
}

/// @nodoc
class _$ThemeCopyWithImpl<$Res, $Val extends Theme>
    implements $ThemeCopyWith<$Res> {
  _$ThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ActiveTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThemeCopyWith<$Res> implements $ThemeCopyWith<$Res> {
  factory _$$_ThemeCopyWith(_$_Theme value, $Res Function(_$_Theme) then) =
      __$$_ThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActiveTheme themeMode});
}

/// @nodoc
class __$$_ThemeCopyWithImpl<$Res> extends _$ThemeCopyWithImpl<$Res, _$_Theme>
    implements _$$_ThemeCopyWith<$Res> {
  __$$_ThemeCopyWithImpl(_$_Theme _value, $Res Function(_$_Theme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$_Theme(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ActiveTheme,
    ));
  }
}

/// @nodoc

class _$_Theme implements _Theme {
  const _$_Theme({required this.themeMode});

  @override
  final ActiveTheme themeMode;

  @override
  String toString() {
    return 'Theme(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Theme &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThemeCopyWith<_$_Theme> get copyWith =>
      __$$_ThemeCopyWithImpl<_$_Theme>(this, _$identity);
}

abstract class _Theme implements Theme {
  const factory _Theme({required final ActiveTheme themeMode}) = _$_Theme;

  @override
  ActiveTheme get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$_ThemeCopyWith<_$_Theme> get copyWith =>
      throw _privateConstructorUsedError;
}
