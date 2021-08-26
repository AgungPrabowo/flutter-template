import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/dashboard.dart';
import 'package:flutter_template/example_admob.dart';
import 'package:flutter_template/shared/helper/helper.dart';

class HelperDrawer {
  Drawer drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              height: 150,
              width: 150,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: const Text('home').tr(),
            onTap: () {
              Navigator.pop(context);
              Utils.myPushPageReplacement(DashboardScreen(), context);
            },
          ),
          ListTile(
            title: const Text('admob').tr(),
            onTap: () {
              Navigator.pop(context);
              Utils.myPushPageReplacement(ExampleAdmob(), context);
            },
          ),
        ],
      ),
    );
  }
}
