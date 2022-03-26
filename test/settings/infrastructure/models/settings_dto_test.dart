import 'dart:convert';

import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:blog/src/settings/infrastructure/models/settings_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tSettingsDTO = SettingsDTO(
    themeMode: 'system',
  );
  const tSettingsDTODark = SettingsDTO(
    themeMode: 'dark',
  );

  test(
    "should be a subclasss of Settings entity",
    () async {
      // assert
      expect(tSettingsDTO.toDomain(), isA<Settings>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        "should return a valid model when the JSON themeMode is null",
        () async {
          /// arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('settings_null.json'));

          /// act
          final result = SettingsDTO.fromJson(jsonMap);

          /// assert
          expect(result, tSettingsDTO);
        },
      );

      test(
        "should return a valid model when the JSON themeMode is not null",
        () async {
          /// arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('settings.json'));

          /// act
          final result = SettingsDTO.fromJson(jsonMap);

          /// assert
          expect(result, tSettingsDTODark);
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          /// act
          final result = tSettingsDTO.toJson();

          /// assert
          final expectedJsonMap = {
            'themeMode': 'system',
          };
          expect(result, expectedJsonMap);
        },
      );
    },
  );
}
