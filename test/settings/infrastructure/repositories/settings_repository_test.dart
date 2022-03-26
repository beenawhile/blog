import 'package:blog/src/error/domain/exceptions.dart';
import 'package:blog/src/error/domain/failures.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:blog/src/settings/infrastructure/models/settings_dto.dart';
import 'package:blog/src/settings/infrastructure/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_settings_service.dart';

void main() {
  late SettingsRepository repository;
  late MockSettingsService mockService;
  setUp(
    () {
      mockService = MockSettingsService();
      repository = SettingsRepository(
        service: mockService,
      );
    },
  );

  const tTheme = 'dark';
  const tSettings = Settings(
    themeMode: tTheme,
  );

  group(
    'loadTheme',
    () {
      test(
        "should return the data when the service call is successful",
        () async {
          /// arrange
          when(() => mockService.themeMode)
              .thenAnswer((_) async => SettingsDTO.fromDomain(tSettings));

          /// act
          final result = await repository.loadTheme();

          /// assert
          expect(result, const Right(tSettings));
          verify(() => mockService.themeMode);
        },
      );

      test(
        "should throw InternalCacheException when the service call is not successful",
        () async {
          /// arrange
          when(() => mockService.themeMode).thenThrow(InternalCacheException());

          /// act
          final result = await repository.loadTheme();

          /// assert
          expect(result, const Left(Failure.internal()));
          verify(() => mockService.themeMode);
          verifyNoMoreInteractions(mockService);
        },
      );
    },
  );

  group(
    'updateThemeMode',
    () {
      test(
        "should pass the call when the service call is successful",
        () async {
          /// arrange
          when(() => mockService.updateThemeMode(any()))
              .thenAnswer((_) async {});

          /// act
          final result = await repository.updateTheme(tTheme);

          /// assert
          expect(result, const Right(unit));
          verify(() => mockService.updateThemeMode(tTheme));
          verifyNoMoreInteractions(mockService);
        },
      );

      test(
        "should throw InternalCacheException when the service call is not successful",
        () async {
          /// arrange
          when(() => mockService.updateThemeMode(any()))
              .thenThrow(InternalCacheException());

          /// act
          final result = await repository.updateTheme(tTheme);

          /// assert
          expect(result, const Left(Failure.internal()));
          verify(() => mockService.updateThemeMode(tTheme));
          verifyNoMoreInteractions(mockService);
        },
      );
    },
  );
}
