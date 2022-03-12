import 'package:blog/src/settings/application/settings_controller.dart';
import 'package:flutter/material.dart';

class SettingsScope extends InheritedWidget {
  const SettingsScope(
      {Key? key, required this.controller, required Widget child})
      : super(key: key, child: child);

  final SettingsController controller;

  static SettingsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsScope>()!
        .controller;
  }

  @override
  bool updateShouldNotify(SettingsScope oldWidget) {
    return controller != oldWidget.controller;
  }
}
