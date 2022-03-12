import 'package:blog/src/settings/infrastructure/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSettingsService extends SettingsService {
  final SharedPreferences _prefs;

  static const _modeKey = "theme_mode";

  const SharedPrefSettingsService(
    this._prefs,
  );

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
