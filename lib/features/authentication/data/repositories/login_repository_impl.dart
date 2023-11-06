import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/authentication/data/models/login_response/login_response.dart';
import 'package:color_generator/features/authentication/data/providers/providers.dart';
import 'package:color_generator/features/authentication/domain/entities/login/login.dart';
import 'package:color_generator/features/authentication/domain/repositories/login_repository.dart';
import 'package:color_generator/features/authentication/domain/usecases/post_login.dart';
import 'package:color_generator/utils/services/hive/main_box_mixin.dart';
import 'package:dartz/dartz.dart';


/// Implementation of the [LoginRepository] interface.
class LoginRepositoryImpl implements LoginRepository {

  /// The authentication provider that this repository interacts with.
  final AuthProvider provider;

  /// A mixin that allows storage the data (Hive box).
  final MainBoxMixin mainBoxMixin;

  /// Constructs a [LoginRepositoryImpl]
  /// with an [AuthProvider] and [MainBoxMixin].
  const LoginRepositoryImpl({
    required this.provider,
    required this.mainBoxMixin,
  });

  /// Logs in the user using the given [LoginParams].
  ///
  /// On success, stores login state and token in a box and converts
  /// the [LoginResponse] to a [Login] entity. On failure, returns a [Failure].
  @override
  Future<Either<Failure, Login>> login({required LoginParams params}) async {
    final Either<Failure, LoginResponse> response = await provider.login(
      params: params,
    );

    return response.fold(
          // ignore: unnecessary_lambdas
          (failure) => Left(failure),
          (loginResponse) async {
        await mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        await mainBoxMixin.addData(MainBoxKeys.token, loginResponse.token);

        return Right(loginResponse.toEntity());
      },
    );
  }

  /// Logs out the current user.
  ///
  /// This method should be replaced with actual logout logic.
  @override
  Future<void> logout() {
    // Placeholder for logout logic.
    throw UnimplementedError();
  }
}
