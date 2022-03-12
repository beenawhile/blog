import 'package:blog/src/settings/application/settings_controller.dart';
import 'package:blog/src/settings/presentation/settings_scope.dart';
import 'package:blog/src/settings/presentation/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_settings_service.dart';

void main() {
  group(
    'SettingsView',
    () {
      testWidgets(
        'should display right theme when a corresponding dropdown button is clicked',
        (WidgetTester tester) async {
          final service = FakeSettingsService();

          final controller = SettingsController(service);
          await controller.loadSettings();
          final settings = SettingsScope(
              controller: controller, child: const SettingsView());

          await tester.pumpWidget(MaterialApp(home: settings));

          await tester.tap(find.byType(DropdownButton<ThemeMode>));
          await tester.pumpAndSettle();

          final itemFinder = find.text('Dark Theme').last;
          await tester.tap(itemFinder);
          await tester.pumpAndSettle();

          expect(controller.themeMode, ThemeMode.dark);
        },
      );
    },
  );
}
