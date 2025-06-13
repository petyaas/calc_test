abstract class CalculatorEvent {}

class CalculatePressed extends CalculatorEvent {
  final double value;
  final double percent;

  CalculatePressed(this.value, this.percent);
}

class ResetPressed extends CalculatorEvent {}