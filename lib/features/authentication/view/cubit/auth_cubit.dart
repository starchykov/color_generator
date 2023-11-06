import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/authentication/domain/usecases/post_login.dart';
import 'package:color_generator/utils/services/hive/main_box_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
/// `AuthCubit` is a Cubit that manages the state of the login page.
/// It mixes in `MainBoxMixin` to provide additional functionality
/// related to main storage.
class AuthCubit extends Cubit<AuthState> with MainBoxMixin {
  /// This use case is responsible for login API calls.
  final PostLogin postLogin;

  /// A private field `_state` that holds the current state of the login page.
  AuthState _state = const AuthState();

  /// Constructor for [AuthCubit] with required use cases
  /// for authentication management.
  AuthCubit({required this.postLogin}) : super(const AuthState());

  /// Called when the login input is changed by the user.
  /// If the input is the same as the current state, it does nothing.
  /// Otherwise, it updates the state with the new login value.
  void onLoginPrint({required String value}) {
    if (_state.login == value) return;
    _state = _state.copyWith(login: value);
    emit(_state);
  }

  /// Called when the password input is changed by the user.
  /// If the input is the same as the current state, it does nothing.
  /// Otherwise, it updates the state with the new password value.
  void onPasswordPrint({required String value}) {
    if (_state.password == value) return;
    _state = _state.copyWith(password: value);
    emit(_state);
  }

  /// Toggles the visibility of the password in the login form.
  /// It triggers haptic feedback to give a tactile response to the user.
  /// Then, it updates the state to either show or hide the password.
  void showPassword() {
    HapticFeedback.selectionClick();
    _state = _state.copyWith(hidePassword: !_state.hidePassword);
    emit(_state);
  }

  /// Handles the login button press action.
  /// First, it checks if the login and password fields are not empty.
  /// It sets the authentication state to true and clears previous errors,
  /// then it attempts to login using the provided credentials.
  /// Depending on the result, it updates the state with the outcome
  /// of the login attempt and emits the new state.
  Future<void> onLoginButtonPress() async {
    final String login = _state.login;
    final String password = _state.password;

    if (login.isEmpty || password.isEmpty) return;

    _state = _state.copyWith(authInProcess: true, authErrorTitle: '');
    emit(_state);

    final LoginParams params = LoginParams(email: login, password: password);
    final data = await postLogin.call(params);

    data.fold(
      (l) {
        final ServerFailure failure = l as ServerFailure;
        _state = _state.copyWith(
          authInProcess: false,
          authErrorTitle: failure.message ?? '',
        );
        emit(_state);
      },
      (r) {
        _state = _state.copyWith(authInProcess: false, authErrorTitle: '');
        emit(_state);
      },
    );
  }

  /// Logs the user out.
  /// It calls `logoutBox` to perform any logout related storage operations.
  /// Then it resets the login and password in the state.
  Future<void> logout() async {
    await logoutBox();
    _state = _state.copyWith(login: '', password: '');
    emit(_state);
  }
}
