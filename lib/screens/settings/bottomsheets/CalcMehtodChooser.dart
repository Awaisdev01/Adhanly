import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/helpers/adhan_dependencies.dart';
import 'package:adhanly/prviders/dependencies/AdhanDependencyProvider.dart';
import 'package:provider/provider.dart';
import 'Chooser.dart';

class CalcMethodChooser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final adhanDependency = context.watch<AdhanDependencyProvider>();
    final appLocale = context.appLocale;
    return choosingContainer(
      context: context,
      title: appLocale.calc_method,
      titles: adhanCalculationMethodNames,
      subtitles: adhanCalculationMethodDescs,
      selected: (i) => adhanDependency.calMethodIndex == i,
      onChoosen: adhanDependency.changeCalMethod,
      percentageUpto: 0.9
    );
  }
}
