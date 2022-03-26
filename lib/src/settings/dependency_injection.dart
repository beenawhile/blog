import 'package:blog/src/settings/application/settings_state.dart';
import 'package:blog/src/settings/application/settings_state_notifier.dart';
import 'package:blog/src/settings/domain/repositories/i_settings_repository.dart';
import 'package:blog/src/settings/domain/usecases/load_theme.dart';
import 'package:blog/src/settings/domain/usecases/update_theme.dart';
import 'package:blog/src/settings/infrastructure/datasources/local/settings_local_shared_prefs_service.dart';
import 'package:blog/src/settings/infrastructure/datasources/settings_service.dart';
import 'package:blog/src/settings/infrastructure/repositories/settings_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//! Application
final settingsStateNotifierProvider =
    StateNotifierProvider<SettingsStateNotifier, SettingsState>(
  (ref) => SettingsStateNotifier(
    loadTheme: ref.watch(loadThemeProvider),
    updateTheme: ref.watch(updateThemeProvider),
  ),
);

//! Usecases
final loadThemeProvider = Provider<LoadTheme>(
  (ref) => LoadTheme(
    repository: ref.watch(settingsRepositoryProvider),
  ),
);

final updateThemeProvider = Provider<UpdateTheme>(
  (ref) => UpdateTheme(
    repository: ref.watch(settingsRepositoryProvider),
  ),
);

//! Repository
final settingsRepositoryProvider = Provider<ISettingsRepository>(
  (ref) => SettingsRepository(
    service: ref.watch(settingsLocalServiceProvider),
  ),
);

//! Datasource
final settingsLocalServiceProvider = Provider<SettingsService>(
  (ref) =>
      SettingsLocalSharedPrefsService(storage: ref.watch(sharedPrefsProvider)),
);

//! External
final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);
