import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
    );
  }

  static void myPushPage(Widget pagePush, context,
      {bool withBottomNavigation = true}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (contexts) {
          return pagePush;
        },
      ),
    );
  }

  static void myPushPageReplacement(Widget pagePush, context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (contexts) {
          return pagePush;
        },
      ),
    );
  }
}
