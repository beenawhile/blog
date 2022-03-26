import 'package:blog/src/settings/infrastructure/models/settings_dto.dart';

abstract class SettingsService {
  Future<SettingsDTO> get themeMode;
  Future<void> updateThemeMode(String themeMode);
}
