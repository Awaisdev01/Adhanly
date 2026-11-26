import 'package:flutter/material.dart';
import 'package:adhanly/extensions.dart';
import 'package:adhanly/helpers/SQLHelper.dart';
import 'package:adhanly/prviders/dependencies/DuaDependencyProvider.dart';
import 'package:adhanly/prviders/duas_provider.dart';
import 'package:adhanly/screens/dua/category_list.dart';
import 'package:adhanly/screens/dua/searchScreen.dart';
import 'package:adhanly/widgets/CheckedFutureBuilder.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class DuaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final duaDependency = context.watch<DuaDependencyProvider>();
    final appLocale = context.appLocale;

    return CheckedFutureBuilder<Database>(
      future: getDatabase(),
      builder: (val) {
        final duaProvider = DuaProvider(val, appLocale, duaDependency);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              appLocale.dua,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider.value(
                        value: duaProvider,
                        child: SearchScreen(),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: ChangeNotifierProvider(
            create: (_) => duaProvider,
            child: const CategoryList(),
          ),
        );
      },
    );
  }
}
