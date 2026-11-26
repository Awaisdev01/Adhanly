import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/helpers/gps_location_helper.dart';
import 'package:adhanly/prviders/adhanProvider.dart';
import 'package:adhanly/prviders/dependencies/AdhanDependencyProvider.dart';
import 'package:adhanly/prviders/locationProvider.dart';
import 'package:adhanly/screens/adhan/widgets/AdhanAvailableScreen.dart';
import 'package:adhanly/screens/locationFindingScreen.dart';
import 'package:adhanly/screens/locationNotAvailableScreen.dart';
import 'package:adhanly/screens/unknownErrorScreen.dart';
import 'package:provider/provider.dart';

class AdhanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final adhanDep = context.watch<AdhanDependencyProvider>();
    final locationState = context.watch<LocationProvider>().locationState;

    return Scaffold(
      body: SafeArea(
        child: (locationState is LocationAvailable)
            ? ChangeNotifierProvider(
                create: (_) => AdhanProvider(
                    adhanDep, locationState.locationInfo, context.appLocale),
                child: AdhanAvailableScreen(locationState.locationInfo))
            : (locationState is LocationFinding)
                ? const LocationFindingScreen()
                : (locationState is LocationNotAvailable)
                    ? LocationNotAvailableScreen(locationState)
                    : const UnknownErrorScreen(),
      ),
    );
  }

  const AdhanScreen();
}
