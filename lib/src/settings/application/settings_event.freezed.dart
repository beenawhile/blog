// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

  _LoadTheme loadTheme() {
    return const _LoadTheme();
  }

  _UpdateThemeMode updateThemeMode(String theme) {
    return _UpdateThemeMode(
      theme,
    );
  }
}

/// @nodoc
const $SettingsEvent = _$SettingsEventTearOff();

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTheme,
    required TResult Function(String theme) updateThemeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateThemeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateThemeMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTheme value) loadTheme,
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateThemeMode value)? updateThemeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateThemeMode value)? updateThemeMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class _$LoadThemeCopyWith<$Res> {
  factory _$LoadThemeCopyWith(
          _LoadTheme value, $Res Function(_LoadTheme) then) =
      __$LoadThemeCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadThemeCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements _$LoadThemeCopyWith<$Res> {
  __$LoadThemeCopyWithImpl(_LoadTheme _value, $Res Function(_LoadTheme) _then)
      : super(_value, (v) => _then(v as _LoadTheme));

  @override
  _LoadTheme get _value => super._value as _LoadTheme;
}

/// @nodoc

class _$_LoadTheme extends _LoadTheme {
  const _$_LoadTheme() : super._();

  @override
  String toString() {
    return 'SettingsEvent.loadTheme()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadTheme);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTheme,
    required TResult Function(String theme) updateThemeMode,
  }) {
    return loadTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateThemeMode,
  }) {
    return loadTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateThemeMode,
    required TResult orElse(),
  }) {
    if (loadTheme != null) {
      return loadTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTheme value) loadTheme,
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
  }) {
    return loadTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateThemeMode value)? updateThemeMode,
  }) {
    return loadTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateThemeMode value)? updateThemeMode,
    required TResult orElse(),
  }) {
    if (loadTheme != null) {
      return loadTheme(this);
    }
    return orElse();
  }
}

abstract class _LoadTheme extends SettingsEvent {
  const factory _LoadTheme() = _$_LoadTheme;
  const _LoadTheme._() : super._();
}

/// @nodoc
abstract class _$UpdateThemeModeCopyWith<$Res> {
  factory _$UpdateThemeModeCopyWith(
          _UpdateThemeMode value, $Res Function(_UpdateThemeMode) then) =
      __$UpdateThemeModeCopyWithImpl<$Res>;
  $Res call({String theme});
}

/// @nodoc
class __$UpdateThemeModeCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$UpdateThemeModeCopyWith<$Res> {
  __$UpdateThemeModeCopyWithImpl(
      _UpdateThemeMode _value, $Res Function(_UpdateThemeMode) _then)
      : super(_value, (v) => _then(v as _UpdateThemeMode));

  @override
  _UpdateThemeMode get _value => super._value as _UpdateThemeMode;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_UpdateThemeMode(
      theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateThemeMode extends _UpdateThemeMode {
  const _$_UpdateThemeMode(this.theme) : super._();

  @override
  final String theme;

  @override
  String toString() {
    return 'SettingsEvent.updateThemeMode(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateThemeMode &&
            const DeepCollectionEquality().equals(other.theme, theme));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(theme));

  @JsonKey(ignore: true)
  @override
  _$UpdateThemeModeCopyWith<_UpdateThemeMode> get copyWith =>
      __$UpdateThemeModeCopyWithImpl<_UpdateThemeMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTheme,
    required TResult Function(String theme) updateThemeMode,
  }) {
    return updateThemeMode(theme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateThemeMode,
  }) {
    return updateThemeMode?.call(theme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateThemeMode,
    required TResult orElse(),
  }) {
    if (updateThemeMode != null) {
      return updateThemeMode(theme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTheme value) loadTheme,
    required TResult Function(_UpdateThemeMode value) updateThemeMode,
  }) {
    return updateThemeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateThemeMode value)? updateThemeMode,
  }) {
    return updateThemeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateThemeMode value)? updateThemeMode,
    required TResult orElse(),
  }) {
    if (updateThemeMode != null) {
      return updateThemeMode(this);
    }
    return orElse();
  }
}

abstract class _UpdateThemeMode extends SettingsEvent {
  const factory _UpdateThemeMode(String theme) = _$_UpdateThemeMode;
  const _UpdateThemeMode._() : super._();

  String get theme;
  @JsonKey(ignore: true)
  _$UpdateThemeModeCopyWith<_UpdateThemeMode> get copyWith =>
      throw _privateConstructorUsedError;
}
