import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/localizations/locales.dart';
import 'package:adhanly/prviders/dependencies/DuaDependencyProvider.dart';
import 'package:adhanly/prviders/dependencies/GlobalDependencyProvider.dart';
import 'package:adhanly/prviders/locationProvider.dart';
import 'package:provider/provider.dart';
import 'package:adhanly/screens/settings/bottomsheets/Chooser.dart';

class AppLanguagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final globalConfig = context.watch<GlobalDependencyProvider>();
    final duaDependency = context.read<DuaDependencyProvider>();
    final locationProvider = context.read<LocationProvider>();
    return choosingContainer(
      context: context,
      title: context.appLocale.language,
      titles: supportedLocales.map((e) => e.languageName).toList(),
      subtitles: [],
      selected: (i) => globalConfig.locale == supportedLocales[i].languageCode,
      onChoosen: (i) => globalConfig.changeGlobalLocale(
        supportedLocales[i].languageCode,
        duaDependency,
        locationProvider,
      ),
      percentageUpto: 0.6,
    );
  }
}
