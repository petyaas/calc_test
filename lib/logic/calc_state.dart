abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}

class CalculatorSuccess extends CalculatorState {
  final double result;
  CalculatorSuccess(this.result);
}

class CalculatorError extends CalculatorState {
  final String message;
  CalculatorError(this.message);
}