part of 'auth_cubit.dart';

/// Defines the immutable state for the login page.
@immutable
class AuthState {
  /// The current input for the login field.
  final String login;

  /// The current input for the password field.
  final String password;

  /// Indicates whether an authentication process is currently underway.
  final bool authInProcess;

  /// Indicates whether the password should be hidden in the UI.
  final bool hidePassword;

  /// A message indicating an authentication error, if any.
  final String authErrorTitle;

  /// Computes the state of the login button based on the current
  /// authentication process and input fields.
  LoginButtonState get loginButtonState {
    if (authInProcess) return LoginButtonState.disabled;
    if (login.isEmpty || password.isEmpty) return LoginButtonState.disabled;

    return LoginButtonState.canSubmit;
  }

  /// The constructor for [AuthState] with named optional parameters
  /// with default values.
  const AuthState({
    this.login = '',
    this.password = '',
    this.authInProcess = false,
    this.hidePassword = true,
    this.authErrorTitle = '',
  });

  /// Creates a copy of this state with overridden properties.
  /// If a property is not provided, the current value in the state is retained.
  AuthState copyWith({
    String? authErrorTitle,
    String? login,
    String? password,
    bool? authInProcess,
    bool? hidePassword,
  }) {
    return AuthState(
      authErrorTitle: authErrorTitle ?? this.authErrorTitle,
      login: login ?? this.login,
      password: password ?? this.password,
      authInProcess: authInProcess ?? this.authInProcess,
      hidePassword: hidePassword ?? this.hidePassword,
    );
  }
}

/// An enumeration representing the possible states of the login button.
enum LoginButtonState {
  /// Login button state for valid inputs
  canSubmit,

  /// Login button state for invalid inputs
  disabled
}
