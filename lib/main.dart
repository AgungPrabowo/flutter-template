import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/localization/app_translations_delegate.dart';
import 'package:flutter_template/localization/application.dart';
import 'package:flutter_template/shared/helper/helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  Cache.init();
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppTranslationsDelegate _newLocaleDelegate;

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  void initState() {
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale('en', 'EN'));
    application.onLocaleChanged = onLocaleChange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      localizationsDelegates: [
        _newLocaleDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Container(
          child: Text("Damn"),
        ),
      );
    }
  }
