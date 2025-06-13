import 'package:flutter_test/flutter_test.dart';

double calcPercent(double value, double percent) {
  return value * 100 / percent;
}

void main() {
  test('test', () {
    expect(calcPercent(2000, 115), closeTo(1739.13, 0.01));
    expect(calcPercent(500, 50), equals(1000));
    expect(calcPercent(0, 50), equals(0));
  });
}