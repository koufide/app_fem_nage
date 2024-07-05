
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


}