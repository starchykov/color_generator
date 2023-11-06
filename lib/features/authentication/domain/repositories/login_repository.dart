import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/authentication/domain/entities/login/login.dart';
import 'package:color_generator/features/authentication/domain/usecases/post_login.dart';
import 'package:dartz/dartz.dart';

/// An abstract repository interface that defines the contract for user login
/// and logout operations.
abstract class LoginRepository {
  /// Attempts to log a user in with the given [LoginParams].
  ///
  /// Returns a [Future] that completes with either a [Failure]
  /// or a [Login] object upon success.
  Future<Either<Failure, Login>> login({required LoginParams params});

  /// Logs the current user out.
  ///
  /// Returns a [Future] that completes when the user has been logged out.
  Future<void> logout();
}
