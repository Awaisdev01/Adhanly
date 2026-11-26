import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/helpers/preferences.dart';
import 'package:adhanly/localizations/locales.dart';
import 'package:adhanly/models/preference.dart';
import 'package:adhanly/prviders/app_init_provider.dart';
import 'package:adhanly/prviders/dependencies/AdhanDependencyProvider.dart';
import 'package:adhanly/prviders/dependencies/GlobalDependencyProvider.dart';
import 'package:adhanly/prviders/locationProvider.dart';
import 'package:adhanly/screens/dynamic_display/dynamic_display.dart';
import 'package:adhanly/screens/welcome/welcomeScreen.dart';
import 'package:adhanly/theme.dart';
import 'package:provider/provider.dart';

final onDarkCardColor = Colors.white.withOpacity(0.15);
final onLightCardColor = Colors.blueGrey.withOpacity(0.15);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPreferences();

  runApp(ChangeNotifierProvider(
      create: (_) => AppInitProvider.create(), child: const AdhanlyApp()));
}

class AdhanlyApp extends StatelessWidget {
  const AdhanlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appInitProvider = Provider.of<AppInitProvider>(context, listen: true);
    if (appInitProvider.initComplete) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
              value: GlobalDependencyProvider.getInstance()),
          ChangeNotifierProvider.value(value: LocationProvider.getInstance()),
          ChangeNotifierProvider(create: (_) => AdhanDependencyProvider()),
        ],
        child: const Azan(),
      );
    }

    return MaterialApp(
      themeMode:
          GlobalDependencyProvider.getThemeMode(sharedPrefAdhanThemeMode.value),
      theme: getLightTheme(context),
      darkTheme: getDarkTheme(context),
      home: Scaffold(
          body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 240,
        ),
      )),
    );
  }
}

class Azan extends StatelessWidget {
  const Azan();

  @override
  Widget build(BuildContext context) {
    final globalDependency = context.watch<GlobalDependencyProvider>();
    final locationProvider = context.read<LocationProvider>();

    return MaterialApp(
      localizationsDelegates: appLocaleDelegates,
      supportedLocales: supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first;
      },
      themeMode: globalDependency.themeMode,
      locale: Locale(globalDependency.locale),
      theme: getLightTheme(context),
      darkTheme: getDarkTheme(context),
      home: globalDependency.welcomeScreenShown
          ? DynamicDisplay(locationProvider)
          : const WelcomeScreen(showWarning: false, build: 'Stable'),
    );
  }
}
