
import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:rxdart/rxdart.dart';

sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int>{

  EventTransformer<T> debounce<T>(Duration duration){
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  // CounterBloc(super.initialState);
  CounterBloc(): super(0){
   on<CounterIncrementPressed>(
       (event, emit){

         // addError(Exception('increment error!'), StackTrace.current);

         emit(state+1);
       },

     /// Apply the custom `EventTransformer` to the `EventHandler`.
     // transformer: debounce(const Duration(minutes: 1)),
     transformer: debounce(const Duration(milliseconds: 300)),
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