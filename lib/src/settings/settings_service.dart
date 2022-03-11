import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
abstract class SettingsService {
  const SettingsService();

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode();

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme);
  // Use the shared_preferences package to persist settings locally or the
  // http package to persist settings over the network.
}

class SharedPrefSettingsService extends SettingsService {
  final SharedPreferences _prefs;

  static const _modeKey = "theme_mode";

  const SharedPrefSettingsService({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  @override
  Future<ThemeMode> themeMode() async {
    // get shared prefs for the theme mode
    String? theme = _prefs.getString(_modeKey);

    return ThemeMode.values.byName(theme ?? ThemeMode.system.name);
  }

  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    _prefs.setString(_modeKey, theme.name);
  }
}
