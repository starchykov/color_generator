import 'package:flutter/material.dart';

/// A utility class that defines the color palette for the application.
///
/// This class contains color constants used throughout the app's
/// UI to maintain consistency.
class Palette {

  /// The primary color for the app, used for elements such
  /// as buttons and links.
  static const Color primary = Color(0xFFFF5500);

  /// A fully transparent color, used for hiding elements or creating overlays.
  static const Color transparent = Color(0x00000000);

  /// The background color for the app in light theme.
  static const Color background = Color(0xFFFFFFFF);

  /// The background color for the app in dark theme.
  static const Color backgroundDark = Color(0xFF141824);

  /// The color white, used for text or elements on dark backgrounds.
  static const Color white = Color(0xFFFFFFFF);

  /// A light gray color, used for subtle elements or disabled states.
  static const Color lightGray = Color(0x33787880);

  // Private constructor to prevent instantiation of this utility class.
  Palette._();
}
