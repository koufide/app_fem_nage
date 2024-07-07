import 'package:app_fem_nage/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // return ResponsiveSizer(
    //   builder: (context, orientation, screenType) {
        return Scaffold(
          body: Center(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                print('==> CounterView.build.BlocBuilder =>> $state');
                return Text('$state', style: textTheme.displayMedium);
              },
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                key: const Key('counterView_increment_floatingActionButton'),
                child: const Icon(Icons.add),
                onPressed: () => context.read<CounterCubit>().increment(),
              ),
              // TODO AJOUTER FLUTTER SIZER
              SizedBox(
                height: Adaptive.h(8),
              ),
              FloatingActionButton(
                key: const Key('counterView_decrement_floatingActionButton'),
                child: const Icon(Icons.remove),
                onPressed: () => context.read<CounterCubit>().decrement(),
              ),
            ],
          ),
        );
      // },
    // );
  } //build
} //CounterView
