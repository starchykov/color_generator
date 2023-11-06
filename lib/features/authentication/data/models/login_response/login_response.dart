import 'package:color_generator/features/authentication/domain/entities/login/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

/// A [freezed] annotation to generate immutable classes
/// with pattern matching and other features.
@freezed
class LoginResponse with _$LoginResponse {
  /// A const factory constructor
  /// that can be used to create a [LoginResponse] object.
  /// Can contain a [token] if login is successful,
  /// or an [error] message otherwise.
  const factory LoginResponse({
    String? token,
    String? error,
  }) = _LoginResponse;

  /// A private const constructor for [LoginResponse],
  /// used internally by the generated code.
  const LoginResponse._();

  /// A factory constructor that creates a [LoginResponse] from a JSON map.
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  /// A method that converts [LoginResponse] to the [Login] entity.
  /// It only passes along the [token], which is required for the [Login].
  Login toEntity() => Login(token: token);
}
