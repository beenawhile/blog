import 'package:blog/src/settings/infrastructure/datasources/settings_service.dart';
import 'package:blog/src/settings/infrastructure/models/settings_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsLocalHiveService implements SettingsService {
  late final Box<String> settingBox;

  SettingsDTO get savedSettings =>
      SettingsDTO.fromJson(settingBox.values.first);

  Future<void> initializeDatabase() async {
    await Hive.openBox<String>('settings').then((value) => settingBox = value);

    // first time loading
    if (settingBox.values.isEmpty) {
      settingBox.add(const SettingsDTO(themeMode: "system").toJson());
    }
  }

  @override
  Future<SettingsDTO> get themeMode async => savedSettings;

  @override
  Future<void> updateThemeMode(String themeMode) async {
    await settingBox.put(
        0, savedSettings.copyWith(themeMode: themeMode).toJson());
  }
}
