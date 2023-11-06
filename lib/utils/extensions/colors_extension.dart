import 'dart:ui';

/// The method [ColorsExtension] converts the hexadecimal code
/// to the familiar one Flutter
extension ColorsExtension on Color {
  /// Converts a hexadecimal color string to a [Color].
  /// The [value] should be in the format "aabbcc" or "ffaabbcc"
  /// with an optional leading "#".
  static Color fromHex(String value) {
    const int radix = 16;
    const int hexStringLength = 6;
    String hexString = value;

    final RegExp hexColorExp = RegExp(r'^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{8})$');
    // If the string is not valid hex color code, default to white
    if (!hexColorExp.hasMatch(hexString)) hexString = 'FFFFFFFF';
    hexString = hexString.replaceFirst('#', '');
    // If opacity is not defined, add 'ff' (fully opaque)
    if (hexString.length == hexStringLength) hexString = 'ff$hexString';

    return Color(int.parse(hexString, radix: radix));
  }

  /// Returns a hexadecimal color string from a [Color].
  /// If [leadingHashSign] is set to `true`, the string will have a leading "#".
  String toHex({bool leadingHashSign = true}) {
    String hexString = value.toRadixString(16).padLeft(8, '0');
    if (leadingHashSign) hexString = '#$hexString';

    return hexString;
  }
}
