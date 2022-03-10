import 'package:blog/src/settings/settings_service.dart';
import 'package:flutter/material.dart';

class FakeSettingsService with SettingsService {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Future<ThemeMode> themeMode() async => _themeMode;

  /// Persists the user's prefered ThemeMode to Local or remote storage.
  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    _themeMode = theme;
  }
}
