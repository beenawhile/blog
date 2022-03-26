import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const SettingsState._();
  const factory SettingsState.empty() = _Empty;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded(Settings settings) = _Loaded;
  const factory SettingsState.saving() = _Saving;
  const factory SettingsState.saved() = _Saved;
  const factory SettingsState.error(String mesage) = _Failure;
}
