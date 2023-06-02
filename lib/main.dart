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
          fallbackLocale: const Locale('en', 'US'),
          path: 'assets/languages',
          child: const MyHomePage(),
        ),
      ),
    );
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Splash();
          } else {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: Keys.appName,
              theme: Styles.themeData(state.isDarkMode, context),
              home: const DashboardScreen(),
            );
          }
        },
      ),
    );
  }
}
