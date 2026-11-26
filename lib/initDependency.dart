import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:adhanly/helpers/SQLHelper.dart';
import 'package:adhanly/helpers/notification/notifiers.dart';
import 'package:adhanly/models/preference.dart';
import 'package:adhanly/platform_dependents/android_flutter_background_service.dart';
import 'package:adhanly/prviders/dependencies/AdhanDependencyProvider.dart';
import 'package:adhanly/prviders/dependencies/GlobalDependencyProvider.dart';
import 'package:adhanly/prviders/locationProvider.dart';
import 'package:provider/provider.dart';

/*
Future<Widget> initializeAppWith ({required Widget child}) async{


  return MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: _globalDependency), //required for entire app
      ChangeNotifierProvider.value(value: _locationProvider), //required in entire app
      ChangeNotifierProvider(create: (_)=> AdhanDependencyProvider()) //required for homescreen
    ],
    child: child,
  );
}
*/
