import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/main_bloc/main_bloc.dart';
import 'package:flutter_template/dashboard.dart';
import 'package:flutter_template/shared/helper/helper.dart';
import 'package:flutter_template/splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Cache.init();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      ColoredBox(
        color: Colors.white,
        child: EasyLocalization(
          supportedLocales: Keys.listLocal.map((e) => e.locale).toList(),
          fallbackLocale: Locale('en', 'US'),
          path: 'assets/languages',
          child: MyHomePage(),
        ),
      ),
    );
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc()..add(InitMainEvent()),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainLoading) {
            return Splash();
          } else if (state is MainLoaded) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: Keys.APP_NAME,
              theme: Styles.themeData(state.isDarkMode, context),
              home: DashboardScreen()
            );
          } else {
            if (state is MainError) {
              Utils.showToast(state.error);
            }
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Icon(
                    Icons.error,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
