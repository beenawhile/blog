import 'package:blog/src/settings/application/settings_event.dart';
import 'package:blog/src/settings/dependency_injection.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  ThemeMode _theme = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        await ref
            .watch(settingsStateNotifierProvider.notifier)
            .mapEventToState(const SettingsEvent.loadTheme());
        _theme = ref.watch(settingsStateNotifierProvider).maybeWhen(
              orElse: () => ThemeMode.system,
              loaded: (Settings settings) =>
                  ThemeMode.values.byName(settings.themeMode),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          value: _theme,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: (ThemeMode? themeMode) {
            if (themeMode != null) {
              ref.read(settingsStateNotifierProvider.notifier).mapEventToState(
                  SettingsEvent.updateThemeMode(themeMode.name));
            }
          },
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
