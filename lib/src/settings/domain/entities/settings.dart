import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

@freezed
class Settings with _$Settings {
  const Settings._();
  const factory Settings({
    required String themeMode,
  }) = _Settings;
}
