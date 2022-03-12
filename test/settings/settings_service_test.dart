import 'package:blog/src/settings/infrastructure/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group(
    'SharedPrefsSettingsService should',
    () {
      test(
        'validate settings are persisted',
        () async {
          TestWidgetsFlutterBinding.ensureInitialized();

          SharedPreferences.setMockInitialValues({
            "theme_mode": "dark",
          });

          final prefs = await SharedPreferences.getInstance();
          SettingsService settings = SharedPrefSettingsService(prefs);
          ThemeMode mode = await settings.themeMode();
          expect(mode, ThemeMode.dark);

          await settings.updateThemeMode(ThemeMode.system);
          mode = await settings.themeMode();
          expect(mode, ThemeMode.system);
        },
      );
    },
  );
}
