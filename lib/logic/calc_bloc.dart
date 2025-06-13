import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'calc_state.dart';
import 'calc_event.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final Box _historyBox = Hive.box('history');

  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatePressed>((event, emit) {
      if (event.value <= 0 || event.percent <= 0) {
        emit(CalculatorError('Большк нуля'));
      } else {
        final result = event.value * 100 / event.percent;
        _historyBox.add({
          'value': event.value,
          'percent': event.percent,
          'result': result,
          'timestamp': DateTime.now().toIso8601String(),
        });
        emit(CalculatorSuccess(result));
      }
    });

    on<ResetPressed>((event, emit) => emit(CalculatorInitial()));
  }
}