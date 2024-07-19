
import 'package:app_fem_nage/authentication/bloc/authentication_bloc.dart';
import 'package:app_fem_nage/configuration/my_app_theme.dart';
import 'package:app_fem_nage/counter/counter.dart';
import 'package:app_fem_nage/counter/view/counter_page.dart';
import 'package:app_fem_nage/home/view/home_page.dart';
import 'package:app_fem_nage/login/view/login_page.dart';
import 'package:app_fem_nage/splash/view/splash_page.dart';
// import 'package:app_fem_nage/old_main.dart';
import 'package:app_fem_nage/timer/view/timer_page.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:app_fem_nage/configuration/constants.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:user_repository/user_repository.dart';


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
} //StatelessWidget

class AppLogin extends StatefulWidget {
  const AppLogin({super.key});

  @override
  State<AppLogin> createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  late AuthenticationRepository _authenticationRepository;
  late UserRepository _userRepository;


  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();

  } //initState

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
        builder: (context, orientation, screenType){
       return RepositoryProvider.value(
           value: _authenticationRepository,
         child: BlocProvider(
             create: (_) => AuthenticationBloc(
                 authenticationRepository: _authenticationRepository,
                 userRepository: _userRepository
             ),
           child: const AppView(),
         ),
       );

        }
    );
  } //build
} //_AppLoginState

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child){
        return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state){
              switch(state.status){
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      // HomeScreen.route(),
                      HomePage.route(),
                          (route) => false
                  );
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      LoginPage.route(),
                      // LoginScreen.route(),
                          (route) => false
                  );
                case AuthenticationStatus.unknown:
                  break;
              }
            }, //listener
          child: child,
        );
      },  //builder
      onGenerateRoute: (_)=> SplashPage.route(),
    ); //MaterialApp
  } //build
} //_AppViewState


