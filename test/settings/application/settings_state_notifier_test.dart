import 'package:blog/src/error/domain/failures.dart';
import 'package:blog/src/settings/application/settings_event.dart';
import 'package:blog/src/settings/application/settings_state.dart';
import 'package:blog/src/settings/dependency_injection.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mocks/mock_usecases.dart';

void main() {
  late MockUpdateTheme mockUpdateTheme;
  late MockLoadTheme mockLoadTheme;
  late SharedPreferences sharedPrefs;

  const _internalErrorMessage = 'Internal Error';

  setUp(
    () {
      mockUpdateTheme = MockUpdateTheme();
      mockLoadTheme = MockLoadTheme();
    },
  );

  ProviderContainer _setProviderContainerForTest() {
    final container = ProviderContainer(
      overrides: [
        sharedPrefsProvider.overrideWithValue(sharedPrefs),
        loadThemeProvider.overrideWithValue(mockLoadTheme),
        updateThemeProvider.overrideWithValue(mockUpdateTheme),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test(
    'initial state should be empty',
    () async {
      // should write line underneath for test
      SharedPreferences.setMockInitialValues({});
      sharedPrefs = await SharedPreferences.getInstance();
      final container = _setProviderContainerForTest();
      expect(container.read(settingsStateNotifierProvider),
          const SettingsState.empty());
    },
  );

  group(
    'UpdateTheme',
    () {
      // The event takes in a String
      const tTheme = 'dark';
      // Settings Instance

      test(
        'should pass the call for the concrete use case',
        () async {
          final container = _setProviderContainerForTest();
          when(() => mockUpdateTheme(any()))
              .thenAnswer((_) async => const Right(unit));
          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.updateThemeMode(tTheme));
          await untilCalled(() => mockUpdateTheme(any()));

          verify(() => mockUpdateTheme(tTheme));
        },
      );

      test(
        "should emit [saving, saved] when setting data succeeds",
        () async {
          final container = _setProviderContainerForTest();
          when(() => mockUpdateTheme(any()))
              .thenAnswer((_) async => const Right(unit));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.empty());

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.updateThemeMode(tTheme));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.saving());

          await untilCalled(() => mockUpdateTheme(any()));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.saved());
        },
      );

      test(
        "should emit [saving, error] when setting data fails",
        () async {
          final container = _setProviderContainerForTest();
          addTearDown(container.dispose);
          when(() => mockUpdateTheme(any()))
              .thenAnswer((_) async => const Left(Failure.internal()));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.empty());

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.updateThemeMode(tTheme));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.saving());

          await untilCalled(() => mockUpdateTheme(any()));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.error(_internalErrorMessage));
        },
      );
    },
  );

  group(
    'LoadTheme',
    () {
      const tSettings = Settings(themeMode: 'system');

      test(
        "should get data from the usecase",
        () async {
          final container = _setProviderContainerForTest();

          when(() => mockLoadTheme())
              .thenAnswer((_) async => const Right(tSettings));

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.loadTheme());

          await untilCalled(mockLoadTheme);

          verify(mockLoadTheme);
        },
      );

      test(
        "should emit [loading, loaded] when getting data succeeds",
        () async {
          final container = _setProviderContainerForTest();
          when(() => mockLoadTheme()).thenAnswer(
            (_) async => const Right(tSettings),
          );

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.empty());

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.loadTheme());

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.loading());

          await untilCalled(() => mockLoadTheme());

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.loaded(tSettings));
        },
      );
      test(
        "should emit [loading, error] when getting data fails",
        () async {
          final container = _setProviderContainerForTest();
          when(() => mockLoadTheme()).thenAnswer(
            (_) async => const Left(Failure.internal()),
          );

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.empty());

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.loadTheme());

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.loading());

          await untilCalled(() => mockLoadTheme());

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.error(_internalErrorMessage));
        },
      );
    },
  );
}