import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_dto.g.dart';
part 'settings_dto.freezed.dart';

@freezed
class SettingsDTO with _$SettingsDTO {
  const SettingsDTO._();
  const factory SettingsDTO({
    @JsonKey(defaultValue: 'system') required String themeMode,
  }) = _SettingsDTO;

  factory SettingsDTO.fromJson(Map<String, dynamic> json) =>
      _$SettingsDTOFromJson(json);

  factory SettingsDTO.fromDomain(Settings domain) {
    return SettingsDTO(themeMode: domain.themeMode);
  }

  Settings toDomain() {
    return Settings(themeMode: themeMode);
  }
}
