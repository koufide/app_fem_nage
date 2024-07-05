
import 'package:bloc/bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int>{

  // CounterBloc(super.initialState);
  CounterBloc(): super(0){
   on<CounterIncrementPressed>(
       (event, emit){

         // addError(Exception('increment error!'), StackTrace.current);

         emit(state+1);
       }
   );
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    print("==> CounterBloc.onChange =>>> $change");
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print("==> CounterBloc.onTransition =>>> $transition");
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    // print(event);
    print("==> CounterBloc.onEvent =>>> $event");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // print('$error, $stackTrace');
    print("==> CounterBloc.onError =>>> $error, $stackTrace");
    super.onError(error, stackTrace);
  }


}