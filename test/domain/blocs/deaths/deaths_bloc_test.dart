import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeathsBloc tests', () {
    late DeathsBloc deathsBloc;

    setUp(() => deathsBloc = DeathsBloc());

    test('initial state is DeathsInitial',
        () => expect(deathsBloc.state, DeathsInitial()));
  });
}
