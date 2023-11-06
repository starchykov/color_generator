import 'package:color_generator/core/navigation/navigation_refresh_stream.dart';
import 'package:color_generator/core/screen_factory/screen_factory.dart';
import 'package:color_generator/dependencies_injection.dart';
import 'package:color_generator/features/authentication/view/cubit/auth_cubit.dart';
import 'package:color_generator/utils/services/hive/main_box_mixin.dart';
import 'package:go_router/go_router.dart';

/// A class responsible for handling navigation within the app
/// using the GoRouter package.
///
/// It defines the navigation rules,
/// including redirection based on authentication status.
class Navigation with MainBoxMixin {
  /// The [GoRouter] instance that defines all the routes
  /// and redirection logic for the app.
  ///
  /// Use `routerNeglect` to avoid adding actions to the browser's history.
  static final GoRouter router = GoRouter(
    routerNeglect: true,
    initialLocation: ApplicationRoutes.root.path,
    redirect: (context, state) {
      final location = state.matchedLocation;
      final loginPath = ApplicationRoutes.loginWidget.path;
      final isLoginPage = location == loginPath;

      // Retrieves login status.
      final isLoggedIn = sl<MainBoxMixin>().getData<bool?>(MainBoxKeys.isLogin)
          ?? false;

      // Redirects to the login page if not logged in and not on the login page.
      if (!isLoggedIn) return isLoginPage ? null : loginPath;

      // Redirects to the root if logged in and on the login page.
      if (isLoginPage) return ApplicationRoutes.root.path;

      // No redirection needed.
      return null;
    },
    refreshListenable: NavigationRefreshStream(stream: sl<AuthCubit>().stream),
    routes: [
      GoRoute(
        path: ApplicationRoutes.root.path,
        name: ApplicationRoutes.root.name,
        redirect: (_, __) => ApplicationRoutes.homeWidget.path,
      ),
      GoRoute(
        path: ApplicationRoutes.loginWidget.path,
        name: ApplicationRoutes.loginWidget.name,
        builder: (_, __) => ScreenFactory.renderLoginScreen(),
      ),
      GoRoute(
        path: ApplicationRoutes.homeWidget.path,
        name: ApplicationRoutes.homeWidget.name,
        builder: (_, __) => ScreenFactory.renderHomeScreen(),
      ),
    ],
  );

  // Private constructor to prevent instantiation of this utility class.
  Navigation._();
}

/// An enumeration of routes used within the app.
///
/// This enum provides a type-safe way of defining and accessing routes' paths.
enum ApplicationRoutes {
  /// The root path of the app, usually the entry point.
  root('/'),

  /// The path to the login widget/screen.
  loginWidget('/login'),

  /// The path to the home widget/screen.
  homeWidget('/home'),

  /// The path to the settings widget/screen.
  colorGeneratorWidget('/color_generator'),

  /// The path to the settings widget/screen.
  settingsWidget('/settings');

  const ApplicationRoutes(this.path);

  /// The path associated with the route.
  final String path;
}
