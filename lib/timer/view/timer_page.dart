import 'package:app_fem_nage/configuration/my_app_colors.dart';
import 'package:app_fem_nage/ticker.dart';
import 'package:app_fem_nage/timer/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App fem nage Timer'),
      ),
      body: const Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              Actions(),
            ],
          )
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * recuperer la valeur du bloc
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...switch (state) {
                TimerInitial() => [
                    FloatingActionButton(
                      child: const Icon(Icons.play_arrow),
                      // ! ajouter une action.
                      onPressed: () => context
                          .read<TimerBloc>()
                          .add(TimerStarted(duration: state.duration)),
                    ),
                  ],
                TimerRunInProgress() => [
                    FloatingActionButton(
                      child: const Icon(Icons.pause),
                      // ! ajouter une action.
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerPaused()),
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.replay),
                      // ! ajouter une action.
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerReset()),
                    ),
                  ],
                TimerRunPause() => [
                    FloatingActionButton(
                      child: const Icon(Icons.play_arrow),
                      // ! ajouter une action.
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerResumed()),
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.replay),
                      // ! ajouter une action.
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerReset()),
                    ),
                  ],
                TimerRunComplete() => [
                    FloatingActionButton(
                      child: const Icon(Icons.replay),
                      // ! ajouter une action.
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerReset()),
                    ),
                  ],
              }
            ],
          );
        });
  }
}


class Background extends StatelessWidget {
  const Background({Key? fik}):super(key: fik);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          MyAppColors.primary,
          MyAppColors.secondary
        ],
        )
      ),
    );
  }
}
