import 'package:blog/src/app.dart';
import 'package:blog/src/settings/application/settings_controller.dart';
import 'package:blog/src/settings/presentation/settings_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_settings_service.dart';

void main() {
  group(
    'ServiceController.updateThemeMode should',
    () {
      test(
        'inform ther service of the value',
        () async {
          final service = FakeSettingsService();
          final controller = SettingsController(service);
          await controller.loadSettings();

          expect(controller.themeMode, ThemeMode.system);
          expect(await service.themeMode(), ThemeMode.system);

          controller.updateThemeMode(ThemeMode.dark);
          expect(controller.themeMode, ThemeMode.dark);
          expect(await service.themeMode(), ThemeMode.dark);
        },
      );

      testWidgets(
        "inform the UI of the value",
        (WidgetTester tester) async {
          final service = FakeSettingsService();
          final controller = SettingsController(service);
          await controller.loadSettings();
          final app = SettingsScope(controller: controller, child: const App());

          await tester.pumpWidget(app);

          expect(tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
              ThemeMode.system);

          controller.updateThemeMode(ThemeMode.dark);

          await tester.pumpWidget(app);

          expect(tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
              ThemeMode.dark);
        },
      );
    },
  );
}
