import 'package:flutter/cupertino.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/prviders/locationProvider.dart';
import 'package:adhanly/screens/Home/Home.dart';
import 'package:adhanly/screens/dynamic_display/widgets/dynamic_content.dart';

class DynamicDisplay extends StatelessWidget {

  final LocationProvider locationProvider;
  const DynamicDisplay(this.locationProvider);

  @override
  Widget build(BuildContext context) {
    return context.isLargeScreen ? LargeDisplayView(locationProvider) : Home(locationProvider);
  }
}
