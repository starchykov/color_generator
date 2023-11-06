import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/authentication/data/models/login_response/login_response.dart';
import 'package:color_generator/features/authentication/domain/usecases/post_login.dart';
import 'package:dartz/dartz.dart';

/// An abstract class that defines the authentication operations.
abstract class AuthProvider {
  /// Attempts to authenticate a user with the given [LoginParams].
  ///
  /// Returns a [Failure] or a [LoginResponse].
  Future<Either<Failure, LoginResponse>> login({required LoginParams params});

  /// Signs out the current user.
  ///
  /// Returns a [Future] that completes when the user has been signed out.
  Future<void> logout();
}

/// An implementation of [AuthProvider] that simulates network calls.
class AuthProviderIml implements AuthProvider {
  /// Constructs an instance of [AuthProviderIml].
  const AuthProviderIml();

  /// Simulates a network call to log in a user.
  ///
  /// Returns a fake [LoginResponse] after a delay, simulating a network call.
  @override
  Future<Either<Failure, LoginResponse>> login({
    required LoginParams params,
  }) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay.

    // Returns a right side of Either indicating success with a fake token.
    return Right(LoginResponse.fromJson({'token': 'FAKE_APPLICATION_TOKEN'}));
  }

  /// Simulates a user logout operation.
  ///
  /// This method should be replaced with actual business logic.
  @override
  Future<void> logout() {
    // Placeholder for logout logic.
    throw UnimplementedError();
  }
}
