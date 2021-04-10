import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingFinished());

  @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    if (event is LoadingStart) {
      yield LoadingStarted();
    } else {
      yield LoadingFinished();
    }
  }
}
