import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'ServiceController.updateThemeMode should',
    () {
      test(
        'inform ther service of the value',
        () async {},
      );

      // testWidgets(
      //   "inform the UI of the value",
      //   (WidgetTester tester) async {
      //     final service = FakeSettingsService();
      //     final controller = SettingsController(service);
      //     await controller.loadSettings();
      //     final app = SettingsScope(controller: controller, child: const App());

      //     await tester.pumpWidget(app);

      //     expect(tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      //         ThemeMode.system);

      //     controller.updateThemeMode(ThemeMode.dark);

      //     await tester.pumpWidget(app);

      //     expect(tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      //         ThemeMode.dark);
      //   },
      // );
    },
  );
}
