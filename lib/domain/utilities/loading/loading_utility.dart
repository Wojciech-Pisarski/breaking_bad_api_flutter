import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

abstract class LoadingUtility {
  static startLoading(BuildContext context) =>
      BlocProvider.of<LoadingBloc>(context).add(LoadingStart());

  static finishLoading(BuildContext context) =>
      BlocProvider.of<LoadingBloc>(context).add(LoadingFinish());
}
