import 'package:blog/src/core/routes/app_router.dart';
import 'package:blog/src/settings/application/settings_event.dart';
import 'package:blog/src/settings/dependency_injection.dart';
import 'package:blog/src/settings/domain/entities/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// The Widget that configures your application.
class App extends ConsumerStatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  static final _router = AppRouter();

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        ref
            .read(settingsStateNotifierProvider.notifier)
            .mapEventToState(const SettingsEvent.loadTheme());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsStateNotifierProvider);
    return MaterialApp.router(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Providing a routerDelegate
      routerDelegate: App._router.routerDelegate,
      routeInformationParser: App._router.routeInformationParser,

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
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),

      themeMode: settingsState.maybeWhen(
        orElse: () => ThemeMode.system,
        loaded: (Settings settings) =>
            ThemeMode.values.byName(settings.themeMode),
      ),
      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
    );
  }
}
