import 'package:blog/src/core/usecases/no_params.dart';
import 'package:blog/src/error/domain/failures.dart';
import 'package:blog/src/settings/application/settings_event.dart';
import 'package:blog/src/settings/application/settings_state.dart';
import 'package:blog/src/settings/dependency_injection.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_usecases.dart';

void main() {
  late MockUpdateTheme mockUpdateTheme;
  late MockLoadTheme mockLoadTheme;

  const _internalErrorMessage = 'Internal Error';

  setUp(
    () {
      mockUpdateTheme = MockUpdateTheme();
      mockLoadTheme = MockLoadTheme();
    },
  );

  setUpAll(
    () {
      // any()자리에 해당 Parameter를 넣을 수  있게 만들어줌
      registerFallbackValue(const NoParams());
    },
  );

  ProviderContainer _setProviderContainerForTest() {
    final container = ProviderContainer(
      overrides: [
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

          when(() => mockLoadTheme(any()))
              .thenAnswer((_) async => const Right(tSettings));

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.loadTheme());

          await untilCalled(() => mockLoadTheme(any()));

          verify(() => mockLoadTheme(any()));
        },
      );

      test(
        "should emit [loading, loaded] when getting data succeeds",
        () async {
          final container = _setProviderContainerForTest();
          when(() => mockLoadTheme(any())).thenAnswer(
            (_) async => const Right(tSettings),
          );

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.empty());

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.loadTheme());

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.loading());

          await untilCalled(() => mockLoadTheme(any()));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.loaded(tSettings));
        },
      );
      test(
        "should emit [loading, error] when getting data fails",
        () async {
          final container = _setProviderContainerForTest();
          when(() => mockLoadTheme(any())).thenAnswer(
            (_) async => const Left(Failure.internal()),
          );

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.empty());

          container
              .read(settingsStateNotifierProvider.notifier)
              .mapEventToState(const SettingsEvent.loadTheme());

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.loading());

          await untilCalled(() => mockLoadTheme(any()));

          expect(container.read(settingsStateNotifierProvider),
              const SettingsState.error(_internalErrorMessage));
        },
      );
    },
  );
}
