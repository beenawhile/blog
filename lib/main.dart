import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:blog/src/app.dart';
import 'package:blog/src/settings/application/settings_controller.dart';
import 'package:blog/src/settings/infrastructure/settings_service.dart';

import 'src/settings/presentation/settings_scope.dart';

Future<void> main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  WidgetsFlutterBinding.ensureInitialized();
  final _prefs = await SharedPreferences.getInstance();
  final SettingsService service = SharedPrefSettingsService(_prefs);
  final settingsController = SettingsController(service);

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    SettingsScope(
      controller: settingsController,
      child: const App(),
    ),
  );
}
