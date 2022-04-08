// import 'package:blog/src/settings/infrastructure/datasources/local/settings_local_shared_prefs_service.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'mocks/mock_shared_preferences.dart';

void main() {
  // late MockSharedPreferences mockStorage;
  // late SettingsLocalSharedPrefsService service;

  // const _key = 'SETTINGS_INFO';

  setUp(
    () {
      // mockStorage = MockSharedPreferences();
      // service = SettingsLocalSharedPrefsService(
      // storage: mockStorage,
      // );
    },
  );

  // group(
  //   'themeMode',
  //   () {
  //     final tSettingsDto = SettingsDTO.fromJson(fixture('settings.json'));
  //     final tSettingsDtoDefault =
  //         SettingsDTO.fromJson(fixture('settings_null.json'));

  //     test(
  //       "should return Settings from SharedPreferences when there is one in the cache",
  //       () async {
  //         /// arrange
  //         when(() => mockStorage.getString(any()))
  //             .thenReturn(fixture('settings.json'));

  //         /// act
  //         final result = await service.themeMode;

  //         /// assert
  //         verify(() => mockStorage.getString(_key));
  //         expect(result, tSettingsDto);
  //       },
  //     );

  //     test(
  //       "should return Settings from SharedPreferences when there is none in the cache",
  //       () async {
  //         /// arrange
  //         when(() => mockStorage.getString(any()))
  //             .thenReturn(fixture('settings_null.json'));

  //         /// act
  //         final result = await service.themeMode;

  //         /// assert
  //         verify(() => mockStorage.getString(_key));
  //         expect(result, tSettingsDtoDefault);
  //       },
  //     );
  //   },
  // );

  // group(
  //   'updateThemeMode',
  //   () {
  //     const tTheme = 'dark';
  //     test(
  //       "shuld pass the call when the call for update is successful",
  //       () async {
  //         when(() => mockStorage.setString(any(), any()))
  //             .thenAnswer((_) async => true);

  //         await service.updateThemeMode(tTheme);

  //         // todo: solve this test issue

  //         verify(() => mockStorage.setString(_key, '{"themeMode":"dark"}'));
  //       },
  //     );
  //   },
  // );
}
