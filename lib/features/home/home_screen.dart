import 'package:color_generator/core/core.dart';
import 'package:color_generator/core/screen_factory/screen_factory.dart';
import 'package:flutter/cupertino.dart';

/// A stateless widget that represents the home screen of the application.
///
/// This screen contains a tab bar to navigate between the Color Generator
/// and Settings screens.
class HomeScreen extends StatelessWidget {
  /// Default [HomeScreen] widget constructs.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // The tab builder that returns the appropriate screen for the tab.
      tabBuilder: (builder, int index) => [
        ScreenFactory.renderColorGeneratorScreen(),
        ScreenFactory.renderSettingsScreen(),
      ][index],
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.color_filter),
            activeIcon: const Icon(CupertinoIcons.color_filter_fill),
            label: AppLocalizations.of(context)?.colors ?? 'Colors',
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.settings),
            activeIcon: const Icon(CupertinoIcons.settings),
            label: AppLocalizations.of(context)?.settings ?? 'Settings',
          ),
        ],
      ),
    );
  }
}
