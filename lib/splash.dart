import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'shared/helper/keys.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(
                  "assets/images/logo.svg",
                  height: 150,
                  width: 150,
                ),
              ),
              Text(
                Keys.APP_NAME,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
