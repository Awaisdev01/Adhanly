import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/models/LocationInfo.dart';
import 'package:adhanly/prviders/adhanProvider.dart';
import 'package:adhanly/screens/adhan/widgets/AdhanDateChanger.dart';
import 'package:adhanly/screens/adhan/widgets/AdhanList.dart';
import 'package:provider/provider.dart';

class AdhanAvailableScreen extends StatelessWidget {
  final PageController _adhanListPageController;
  final LocationInfo _locationInfo;

  AdhanAvailableScreen(this._locationInfo)
      : _adhanListPageController = PageController(initialPage: centerPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Consumer<AdhanProvider>(
          builder: (_, v, child) => v.currentDate.isToday
              ? Container()
              : FloatingActionButton(
                  onPressed: () => _adhanListPageController.animateToPage(
                      centerPage,
                      duration: const Duration(milliseconds: 200), curve: Curves.bounceIn),
                  child: Icon(Icons.refresh),
                ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text(context.appLocale.adhan),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              child: AdhanDateChanger(_adhanListPageController),
            ),
            Expanded(child: AdhanList(_adhanListPageController)),
          ],
        ));
  }
}
