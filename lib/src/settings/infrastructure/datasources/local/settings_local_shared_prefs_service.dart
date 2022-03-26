import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:blog/src/settings/infrastructure/datasources/settings_service.dart';
import 'package:blog/src/settings/infrastructure/models/settings_dto.dart';

class SettingsLocalSharedPrefsService implements SettingsService {
  final SharedPreferences _storage;

  SettingsLocalSharedPrefsService({
    required SharedPreferences storage,
  }) : _storage = storage;

  SettingsDTO? _cachedDTO;

  static const String _key = 'SETTINGS_INFO';

  @override
  Future<SettingsDTO> get themeMode async {
    if (_cachedDTO != null) {
      return _cachedDTO!;
    }

    final jsonString = _storage.getString(_key);
    // Future which is immediately completed
    if (jsonString != null) {
      return _cachedDTO = SettingsDTO.fromJson(json.decode(jsonString));
    } else {
      /// this might be changed if there is more data for Settings except themeMode
      return _cachedDTO = const SettingsDTO(themeMode: 'system');
    }
  }

  @override
  Future<void> updateThemeMode(String theme) async {
    _cachedDTO = _cachedDTO?.copyWith(themeMode: theme);
    await _storage.setString(
      _key,
      jsonEncode(
        _cachedDTO?.toJson() ?? SettingsDTO(themeMode: theme).toJson(),
      ),
    );
  }
}
