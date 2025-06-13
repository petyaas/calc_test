import 'package:calculator/logic/calc_bloc.dart';
import 'package:calculator/logic/calc_event.dart';
import 'package:calculator/logic/calc_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CalculatorBloc', () {
    late CalculatorBloc bloc;

    setUp(() {
      bloc = CalculatorBloc();
    });

    blocTest<CalculatorBloc, CalculatorState>(
      'emits [CalculatorError] when input is <= 0',
      build: () => bloc,
      act: (bloc) => bloc.add(CalculatePressed(0, 115)),
      expect: () => [isA<CalculatorError>()],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'emits [CalculatorSuccess] when valid input is given',
      build: () => bloc,
      act: (bloc) => bloc.add(CalculatePressed(2000, 115)),
      expect: () => [isA<CalculatorSuccess>()],
      verify: (bloc) {
        final state = bloc.state;
        expect(state, isA<CalculatorSuccess>());
        expect((state as CalculatorSuccess).result, closeTo(1739.13, 0.01));
      },
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'resets to CalculatorInitial on ResetPressed',
      build: () => bloc,
      act: (bloc) => bloc.add(ResetPressed()),
      expect: () => [isA<CalculatorInitial>()],
    );
  });
}
