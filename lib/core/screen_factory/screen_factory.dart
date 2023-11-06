import 'package:color_generator/application.dart';
import 'package:color_generator/dependencies_injection.dart';
import 'package:color_generator/features/authentication/view/cubit/auth_cubit.dart';
import 'package:color_generator/features/authentication/view/screens/login_screen.dart';
import 'package:color_generator/features/color_generator/color_generator.dart';
import 'package:color_generator/features/color_generator/cubit/color_generator_cubit.dart';
import 'package:color_generator/features/home/cubit/home_screen_cubit.dart';
import 'package:color_generator/features/home/home_screen.dart';
import 'package:color_generator/features/settings/view/cubit/settings_cubit.dart';
import 'package:color_generator/features/settings/view/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A utility class that provides methods
/// for creating the widgets of different screens of a whole application.
///
/// This class encapsulate the logic of the widgets, providing a clean
/// interface for rendering different parts of the application.
class ScreenFactory {
  // Private constructor to prevent instantiation of this utility class.
  ScreenFactory._();

  /// Creates the root widget of the application with necessary [BlocProvider]s.
  ///
  /// This method sets up the application with multiple providers that supply
  /// cubits/blocs to the widget tree, which are then accessible throughout the app.
  static Widget renderApplication() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthCubit>()),
        BlocProvider(create: (_) => sl<SettingsCubit>()..initialize()),
      ],
      child: const Application(),
    );
  }

  /// Returns the [LoginScreen] widget.
  ///
  /// This method is a simple factory for obtaining the login screen of the app.
  static Widget renderLoginScreen() {
    return const LoginScreen();
  }

  /// Returns the [HomeScreen] widget.
  ///
  /// This method provides the home screen widget, which serves as the
  /// main screen of the app after a user successfully logs in.
  static Widget renderHomeScreen() {
    return BlocProvider(
      create: (context) => sl<HomeScreenCubit>(),
      child: const HomeScreen(),
    );
  }

  /// Returns the [ColorGenerator] screen widget with associated [BlocProvider].
  ///
  /// This method wraps the [ColorGenerator] widget with a [BlocProvider],
  /// to provide a [ColorGeneratorCubit] for managing settings state.
  static Widget renderColorGeneratorScreen() {
    return BlocProvider(
      create: (context) => sl<ColorGeneratorCubit>(),
      child: const ColorGenerator(),
    );
  }

  /// Returns the [SettingScreen] widget with its associated [BlocProvider].
  ///
  /// This method wraps the [SettingScreen] with a [BlocProvider]
  /// to provide a [SettingsCubit] for managing settings state.
  static Widget renderSettingsScreen() {
    return const SettingScreen();
  }
}
