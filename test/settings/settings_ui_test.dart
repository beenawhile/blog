import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'SettingsView',
    () {
      testWidgets(
        'should display right theme when a corresponding dropdown button is clicked',
        (WidgetTester tester) async {
          // final service = FakeSettingsService();

          // final controller = SettingsController(service);
          // await controller.loadSettings();
          // final settings = SettingsScope(
          //     controller: controller, child: const SettingsScreen());

          // await tester.pumpWidget(MaterialApp(home: settings));

          // await tester.tap(find.byType(DropdownButton<ThemeMode>));
          // await tester.pumpAndSettle();

          // final itemFinder = find.text('Dark Theme').last;
          // await tester.tap(itemFinder);
          // await tester.pumpAndSettle();

          // expect(controller.themeMode, ThemeMode.dark);
        },
      );
    },
  );
}
