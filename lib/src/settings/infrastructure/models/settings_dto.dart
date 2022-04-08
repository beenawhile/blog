import 'dart:convert';

import 'package:blog/src/settings/domain/entities/settings.dart';

class SettingsDTO {
  final String themeMode;
  const SettingsDTO({
    required this.themeMode,
  });
  factory SettingsDTO.fromDomain(Settings domain) {
    return SettingsDTO(themeMode: domain.themeMode);
  }

  Settings toDomain() {
    return Settings(themeMode: themeMode);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsDTO && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;

  SettingsDTO copyWith({
    String? themeMode,
  }) {
    return SettingsDTO(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode,
    };
  }

  factory SettingsDTO.fromMap(Map<String, dynamic> map) {
    return SettingsDTO(
      themeMode: map['themeMode'] ?? 'system',
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsDTO.fromJson(String source) =>
      SettingsDTO.fromMap(json.decode(source));
}
