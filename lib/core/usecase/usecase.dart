import 'package:color_generator/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

/// An abstract class that defines a UseCase.
/// It is a generic class that takes a [Type] which is the expected return type,
/// and [Params] which is the type of parameters the use case requires.
abstract class UseCase<Type, Params> {
  /// When implemented, this method will be used to execute the use case
  /// with the given [params] and will return a `Future` of `Either`.
  /// `Either` is represents values with two possibilities: a `Failure`
  /// or a success of [Type].
  Future<Either<Failure, Type>> call(Params params);
}

/// A class representing the absence of parameters for a use case.
/// It is used when a use case does not require any parameters to be executed.
class NoParams {}
