import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_template/shared/helper/drawer.dart';
import 'package:flutter_template/shared/shared.dart';

import 'main.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> setTheme(bool isDark) async {
      await Cache.setCacheBool(Keys.DARK_MODE, isDark);
      Navigator.of(context).popUntil((route) => route.isFirst);
      Utils.myPushPageReplacement(MyHomePage(), context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("home").tr(),
            Spacer(),
            FutureBuilder<bool>(
              initialData: false,
              future: Cache.getCacheBool(Keys.DARK_MODE),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                IconData icon;
                bool isDarkmode = snapshot.data ?? false;
                if (isDarkmode) {
                  icon = Icons.brightness_2;
                } else {
                  icon = Icons.wb_sunny;
                }
                return IconButton(
                  splashRadius: 20,
                  icon: Icon(icon),
                  onPressed: () {
                    setTheme(!isDarkmode);
                  },
                );
              },
            ),
          ],
        ),
      ),
      drawer: HelperDrawer().drawer(context),
      body: Center(
        child: Text("indonesianIs").tr(),
      ),
    );
  }
}
