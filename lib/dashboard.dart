// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_template/shared/helper/drawer.dart';
import 'package:flutter_template/shared/shared.dart';

import 'main.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> setTheme(bool isDark) async {
      await Cache.setCacheBool(Keys.darkMode, isDark);
      Navigator.of(context).popUntil((route) => route.isFirst);
      Utils.myPushPageReplacement(const MyHomePage(), context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("home").tr(),
            const Spacer(),
            FutureBuilder<bool>(
              initialData: false,
              future: Cache.getCacheBool(Keys.darkMode),
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
        child: const Text("indonesianIs").tr(),
      ),
    );
  }
}
