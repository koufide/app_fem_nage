
import 'package:app_fem_nage/configuration/my_app_theme.dart';
import 'package:app_fem_nage/counter/counter.dart';
import 'package:app_fem_nage/counter/view/counter_page.dart';
// import 'package:app_fem_nage/old_main.dart';
import 'package:app_fem_nage/timer/view/timer_page.dart';
import 'package:flutter/material.dart';
// import 'package:app_fem_nage/configuration/constants.dart';
import 'package:flutter_sizer/flutter_sizer.dart';


class CounterApp extends MaterialApp {

  const CounterApp({super.key}) : super(home: const CounterPage() );

} //CounterApp

class TimerApp extends Scaffold {

  const TimerApp({super.key}): super(body: const TimerPage()) ;

} //TimerApp


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            title: 'App Fem Nage',
            theme: MyAppTheme.myLight(),
          home: const TimerPage()
          // home: const TimerApp()
          // home: const CounterApp(),
        );
      },
    );
  }

}
