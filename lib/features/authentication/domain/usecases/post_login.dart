import 'package:color_generator/core/core.dart';
import 'package:color_generator/core/usecase/usecase.dart';
import 'package:color_generator/features/authentication/domain/entities/login/login.dart';
import 'package:color_generator/features/authentication/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_login.freezed.dart';
part 'post_login.g.dart';

/// A use case for performing a login operation.
///
/// This class handles the login process by delegating to a [LoginRepository].
class PostLogin extends UseCase<Login, LoginParams> {
  /// The repository that carries out the login operation.
  final LoginRepository repository;

  /// Constructs a [PostLogin] use case with a required [LoginRepository].
  PostLogin({required this.repository});

  /// Calls the login method on the [repository] with the given [LoginParams].
  ///
  /// Returns a [Failure] or a [Login] object.
  @override
  Future<Either<Failure, Login>> call(LoginParams params) {
    return repository.login(params: params);
  }
}

/// Parameters necessary for a login operation, encapsulated in a class.
///
/// Includes the user's email and password.
@freezed
class LoginParams with _$LoginParams {
  /// A const factory constructor for [LoginParams] which takes an email and
  /// a password, both of which default to an empty string if not provided.
  const factory LoginParams({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginParams;

  /// A factory constructor that creates a [LoginParams] from a JSON map.
  factory LoginParams.fromJson(Map<String, dynamic> json) {
    return _$LoginParamsFromJson(json);
  }
}
