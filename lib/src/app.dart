import 'package:blog/src/core/routes/app_router.dart';
import 'package:blog/src/settings/application/settings_event.dart';
import 'package:blog/src/settings/dependency_injection.dart';
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
    final settings = ref.watch(settingsProvider);
    return MaterialApp.router(
      restorationScopeId: 'app',
      routerDelegate: App._router.routerDelegate,
      routeInformationParser: App._router.routeInformationParser,
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
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.values.byName(settings.themeMode),
    );
  }
}
