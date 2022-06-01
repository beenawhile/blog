import 'package:blog/src/core/domain/entities/no_params.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:blog/src/settings/domain/usecases/load_theme.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_settings_repository.dart';

void main() {
  late MockISettingsRepository mockRepository;
  late LoadTheme usecase;

  setUp(
    () {
      mockRepository = MockISettingsRepository();
      usecase = LoadTheme(
        repository: mockRepository,
      );
    },
  );

  const tTheme = Settings(themeMode: 'dark');

  test(
    'should get theme String from the repository',
    () async {
      /// arrange
      when(() => mockRepository.loadTheme()).thenAnswer(
        (invocation) async => const Right(tTheme),
      );

      /// act
      final result = await usecase(const NoParams());

      /// assert
      expect(result, const Right(tTheme));
      verify(mockRepository.loadTheme);
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
