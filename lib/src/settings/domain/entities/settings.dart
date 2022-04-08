class Settings {
  final String themeMode;
  const Settings({
    required this.themeMode,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Settings && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;

  Settings copyWith({
    String? themeMode,
  }) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
