

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  // CounterCubit():super(0); // appel le constructeur parent avec l etat 0
  // CounterCubit(super.initialState);
  CounterCubit(super.initialState);

  void increment() => emit(state + 1);
  void decrement() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print("==> CounterCubit.onChange =>>> $change");
    // print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // print('$error, $stackTrace');
    print("==> CounterCubit.onError =>>> $error, $stackTrace");
    super.onError(error, stackTrace);
  }



}
