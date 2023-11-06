/// An abstract class representing a general failure or error state.
abstract class Failure {
  /// A const constructor for subclasses to initialize Failure instances.
  const Failure();
}

/// A Failure subclass representing errors coming from the server.
class ServerFailure extends Failure {
  /// An optional message that can provide additional information
  /// about the server failure.
  final String? message;

  /// Overrides the `hashCode` getter to provide a hash code for this object,
  /// which is based on the message.
  @override
  int get hashCode => message.hashCode;

  /// A const constructor for ServerFailure which allows to pass
  /// an optional message.
  const ServerFailure(this.message);

  /// Defines equality based on whether the other object is also a ServerFailure
  /// and has the same message.
  @override
  bool operator ==(Object other) => other is ServerFailure
      && other.message == message;
}

/// A Failure subclass representing a scenario where no data is available.
class NoDataFailure extends Failure {
  /// Provides a hash code for this object.
  @override
  int get hashCode => 0;

  /// Defines equality based on whether the other object is a NoDataFailure.
  @override
  bool operator ==(Object other) => other is NoDataFailure;
}

/// A Failure subclass representing failures due to cache-related issues.
class CacheFailure extends Failure {
  /// Provides a hash code for this object.
  @override
  int get hashCode => 0;

  /// Defines equality based on whether the other object is also a CacheFailure.
  @override
  bool operator ==(Object other) => other is CacheFailure;
}
