import 'package:blog/src/settings/domain/usecases/update_theme.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_settings_repository.dart';

void main() {
  late MockISettingsRepository mockRepository;
  late UpdateTheme usecase;

  setUp(
    () {
      mockRepository = MockISettingsRepository();
      usecase = UpdateTheme(
        repository: mockRepository,
      );
    },
  );

  const tTheme = 'dark';
  test(
    "should update theme from the repository",
    () async {
      when(() => mockRepository.updateTheme(tTheme)).thenAnswer(
        (invocation) async => const Right(unit),
      );

      /// act
      final result = await usecase(tTheme);

      /// assert
      expect(result, const Right(unit));
      verify(() => mockRepository.updateTheme(tTheme));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
