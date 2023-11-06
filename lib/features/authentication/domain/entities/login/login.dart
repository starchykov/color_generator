import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

/// A [freezed] model representing the result of a login operation.
///
/// It contains a [token] that is used for authenticated sessions.
@freezed
class Login with _$Login {
  /// A const factory constructor that may include a [token]
  /// if the login is successful.
  const factory Login({String? token}) = _Login;
}
