import 'package:bloc_test/bloc_test.dart';
import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoadingBloc tests', () {
    late LoadingBloc loadingBloc;

    setUp(() => loadingBloc = LoadingBloc());

    test('initial state is LoadingFinished',
        () => expect(loadingBloc.state, LoadingFinished()));

    blocTest(
      "emits LoadingStarted when LoadingStart is added",
      build: () => loadingBloc,
      act: (bloc) => (bloc as LoadingBloc).add(LoadingStart()),
      expect: () => [LoadingStarted()],
    );

    blocTest(
      "emits LoadingFinished when LoadingFinish is added",
      build: () => loadingBloc,
      act: (bloc) => (bloc as LoadingBloc).add(LoadingFinish()),
      expect: () => [LoadingFinished()],
    );
  });
}
