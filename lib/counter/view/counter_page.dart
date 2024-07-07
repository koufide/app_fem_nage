
import 'package:app_fem_nage/counter/counter.dart';
import 'package:app_fem_nage/counter/view/counter_view.dart';
// import 'package:app_fem_nage/providers/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext  context) {
    // return BlocProvider(
    //   create: (_) => CounterCubit(),
    //   child: const CounterView(),
    // );

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterCubit() ),
        ],
        child: const CounterView(),
    );
  } //build
} //CounterPage
