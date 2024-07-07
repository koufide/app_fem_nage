import 'package:app_fem_nage/providers/bloc/counter_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group(CounterBloc, () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    }); //setUp

    tearDown(() {
      counterBloc.close();
    });

    test('initial state is 0', () {
      expect(counterBloc.state, equals(0));
    }); //test

    blocTest('emits [1] when CounterIncrementPressed is added',
        build: () => counterBloc,
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [1]
    );

    blocTest(
      'emits [-1] when CounterDecrementPressed is added',
      build: () => counterBloc,
      act: (fik) => fik.add(CounterDiscrincrementPressed()),
      expect: () => [-1],
    );


  }); //group
} //main
