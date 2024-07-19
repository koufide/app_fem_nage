import 'package:app_fem_nage/providers/auth_provider.dart';
import 'package:app_fem_nage/providers/bloc/counter_bloc.dart';
import 'package:app_fem_nage/providers/counter_stream.dart';
import 'package:app_fem_nage/providers/cubit/counter_cubit.dart';
import 'package:app_fem_nage/providers/cubit/simple_bloc_observer.dart';
import 'package:app_fem_nage/providers/sum_stream.dart';
import 'package:app_fem_nage/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


void main() async {

  Bloc.observer = SimpleBlocObserver();


  /// Initialize a stream of integers 0-9
  Stream<int> stream = counterStream(10);
  /// Compute the sum of the stream of integers
  int sum = await sumStream(stream);
  /// Print the sum
  print("==> main.sumStream =>> sum: $sum"); // 45

  final cubitA = CounterCubit(0);
  final cubitB = CounterCubit(10);
  // print("==> main =>> cubitA.toString(): $cubitA");
  // print("==> main =>> cubitB.toString(): $cubitB");
  // print("==> main =>> cubitA.toString(): " + cubitA.toString());
  // print("==> main =>> cubitB.toString(): " + cubitB.toString());
  // print(cubitB.toString());

  print("==> main =>> cubitA.state =>>> ${cubitA.state}");
  print("==> main =>> cubitB.state =>>> ${cubitB.state}");
  // print(cubitB.state);

  // print("==> main =>>  cubitA.increment() =>>> "+cubitA.increment);
  // print("==> main =>>  cubitB.decrement() =>>> ${cubitB.decrement}");
  cubitA.increment;
  cubitB.decrement();

  print("==> main =>> cubitA.state =>>> ${cubitA.state}");
  print("==> main =>> cubitB.state =>>> ${cubitB.state}");

  final subscription = cubitA.stream.listen(print); // 1
  // final subscription = cubitA.stream.listen(print); // 1
  cubitA.increment();
  cubitA.increment();
  // cubitA.decrement();
  // await Future.delayed(Duration(seconds: 30)); //attendre 5 secondes
  await Future.delayed(Duration.zero);
  cubitA.increment();
  await subscription.cancel();

  print("==> main =>> cubitA.state =>>> ${cubitA.state}");
  print("==> main =>> cubitB.state =>>> ${cubitB.state}");



  await cubitA.close();
  await cubitB.close();

  // print("==> main =>> cubitA.state =>>> ${cubitA.state}");
  // print("==> main =>> cubitB.state =>>> ${cubitB.state}");
  print("===================================");

  final blocC = CounterBloc();
  print("==> main =>> blocC.state =>>> ${blocC.state}");
  blocC.add(CounterIncrementPressed());
  await Future.delayed(Duration.zero);
  print("==> main =>> blocC.state =>>> ${blocC.state}");
  await blocC.close();






  runApp(
    MultiProvider(providers:
    [
      ChangeNotifierProvider(create: (_)=> AuthProvider() ),
    ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("==> MyApp.build =>>> build");

    return MaterialApp(
      title: 'Gestion des femmes de menage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      // routes: appRoutes,

      // home: BlocProvider(
      //   lazy: false,
      //   create: (context) => CounterBloc(),
      //   child: const LoginScreen(),
      // ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => CounterBloc(),
          ),
        ],
        child: const LoginScreen(),

      ),


      // home: const MyHomePage(title: 'Gestion des servantes'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
