import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/shared/helper/helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Cache.init();
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      theme: Styles.themeData(false, context),
      home: Scaffold(
        body: Center(
          child: Text("Damn"),
        ),
      ),
    );
  }
}
