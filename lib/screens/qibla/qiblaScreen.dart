import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/helpers/gps_location_helper.dart';
import 'package:adhanly/prviders/locationProvider.dart';
import 'package:adhanly/screens/qibla/qiblaAvailableScreen.dart';
import 'package:provider/provider.dart';
import '../locationFindingScreen.dart';
import '../locationNotAvailableScreen.dart';
import '../unknownErrorScreen.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocale = context.appLocale;

    final locationState =
        context.watch<LocationProvider>().locationState;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(appLocale.qibla),
      ),
      body: SafeArea(
        child: (locationState is LocationAvailable)
            ? QiblaAvailableScreen(locationState.locationInfo)
            : (locationState is LocationFinding)
                ? const LocationFindingScreen()
                : (locationState is LocationNotAvailable)
                    ? LocationNotAvailableScreen(locationState)
                    : const UnknownErrorScreen(),
      ),
    );
  }
}
