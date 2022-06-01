import 'package:blog/src/settings/dependency_injection.dart';
import 'package:blog/src/settings/infrastructure/datasources/local/settings_local_hive_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:blog/src/app.dart';

Future<void> main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final settingsService = SettingsLocalHiveService();

  await settingsService.initializeDatabase();

  final settings = settingsService.savedSettings.toDomain();

  runApp(
    ProviderScope(
      overrides: [
        settingsHiveServiceProvider.overrideWithValue(settingsService),
        settingsProvider.overrideWithValue(StateController(settings))
      ],
      child: const App(),
    ),
  );
}
