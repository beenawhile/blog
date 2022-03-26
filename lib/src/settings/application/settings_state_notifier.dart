import 'package:blog/src/error/domain/failures.dart';
import 'package:blog/src/settings/application/settings_event.dart';
import 'package:blog/src/settings/application/settings_state.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:blog/src/settings/domain/usecases/load_theme.dart';
import 'package:blog/src/settings/domain/usecases/update_theme.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  SettingsStateNotifier({
    required LoadTheme loadTheme,
    required UpdateTheme updateTheme,
  })  : _loadTheme = loadTheme,
        _updateTheme = updateTheme,
        super(const SettingsState.empty());

  final UpdateTheme _updateTheme;
  final LoadTheme _loadTheme;

  Future<void> mapEventToState(SettingsEvent event) async {
    event.when(
      loadTheme: () async {
        state = const SettingsState.loading();
        final failureOrResult = await _loadTheme();
        state = failureOrResult.fold(
          (Failure l) => SettingsState.error(_mapFailureToMessage(l)),
          (Settings r) => SettingsState.loaded(r),
        );
      },
      updateThemeMode: (String theme) async {
        state = const SettingsState.saving();
        final failureOrResult = await _updateTheme(theme);
        state = failureOrResult.fold(
          (Failure l) => SettingsState.error(_mapFailureToMessage(l)),
          (Unit _) => const SettingsState.saved(),
        );
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.when(
      internal: () => 'Internal Error',
      server: () => 'Server Communication Error',
    );
  }
}
