import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingStarted extends LoadingState {}

class LoadingFinished extends LoadingState {}
