
import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change){
    super.onChange(bloc, change);
    print('==> SimpleBlocObserver.onChange =>> ${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // print('${bloc.runtimeType} $error $stackTrace');
    print('==> SimpleBlocObserver.onError =>> ${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('==> SimpleBlocObserver.onTransition =>> ${bloc.runtimeType} $transition');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // print('${bloc.runtimeType} $event');
    print('==> SimpleBlocObserver.onEvent =>> ${bloc.runtimeType} $event');
  }




}