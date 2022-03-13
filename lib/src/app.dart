import 'dart:io';

import 'package:blog/src/core/routes/app_router.dart';
import 'package:blog/src/diary/helper.dart';
import 'package:blog/src/settings/presentation/settings_scope.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = AppRouter();
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: SettingsScope.of(context),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Providing a routerDelegate
          routerDelegate: _router.routerDelegate,
          routeInformationParser: _router.routeInformationParser,

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', ''),
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
              visualDensity: Platform.isLinux ||
                      Platform.isMacOS ||
                      Platform.isWindows ||
                      kIsWeb
                  ? VisualDensity.comfortable
                  : VisualDensity.compact),
          darkTheme: ThemeData.dark(),
          themeMode: SettingsScope.of(context).themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          scrollBehavior: const ConstantScrollBehavior(),
        );
      },
    );
  }
}
