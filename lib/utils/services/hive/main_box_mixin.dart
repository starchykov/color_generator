import 'package:hive_flutter/hive_flutter.dart';

/// A mixin for handling local storage using Hive.
///
/// Provides utilities to initialize Hive, and to add, remove,
/// and retrieve data from the main box.
mixin class MainBoxMixin {
  /// The main storage box for the application.
  static Box<dynamic>? _mainBox;

  /// The name of the application's storage box.
  static const String _boxName = 'application_storage';

  /// Initializes Hive and opens the main storage box.
  static Future<void> initHive() async {
    await Hive.initFlutter();
    _mainBox = await Hive.openBox(_boxName);
  }

  /// Adds data to the main storage box with the specified [key] and [value].
  Future<void> addData<T>(MainBoxKeys key, T value) async {
    await _mainBox?.put(key.name, value);
  }

  /// Removes data from the main storage box
  /// associated with the specified [key].
  Future<void> removeData(MainBoxKeys key) async {
    await _mainBox?.delete(key.name);
  }

  /// Retrieves data of type [T] from the main storage box
  /// associated with the specified [key].
  T getData<T>(MainBoxKeys key) => _mainBox?.get(key.name) as T;

  /// Clears user-related data from the main storage box to handle logout.
  Future<void> logoutBox() async {
    await removeData(MainBoxKeys.isLogin);
    await removeData(MainBoxKeys.token);
  }

  /// Closes and optionally deletes the main storage box.
  Future<void> closeBox() async {
    try {
      if (_mainBox == null) return;
      await _mainBox?.close();
      await _mainBox?.deleteFromDisk();
    } catch (e, _) {
      // TODO(starchykov): Replace it with your business logic.
    }
  }
}

/// Enumerated keys used to store and retrieve data from the main Hive box.
enum MainBoxKeys {
  /// The key for the user's authentication token.
  token,

  /// The key indicating whether the user is logged in.
  isLogin,

  /// The key for the user's selected theme.
  theme,

  /// The key for the user's selected locale.
  locale,

  /// The key for the user's selected color.
  color,
}
