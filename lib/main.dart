import 'package:color_generator/core/screen_factory/screen_factory.dart';
import 'package:color_generator/dependencies_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(ScreenFactory.renderApplication());
}
