import 'package:blog/src/settings/dependency_injection.dart';
import 'package:blog/src/settings/infrastructure/datasources/local/settings_local_hive_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:blog/src/app.dart';

Future<void> main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final _settingsService = SettingsLocalHiveService();

  await _settingsService.initializeDatabase();

  final _settings = _settingsService.savedSettings.toDomain();

  final _prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(_prefs),
        settingsHiveServiceProvider.overrideWithValue(_settingsService),
        settingsProvider.overrideWithValue(StateController(_settings))
      ],
      child: const App(),
    ),
  );
}
