import 'dart:math';

class Calc {
  static int randIntRange(min, max) {
    return min + Random().nextInt(max - min);
  }

  static int randDoubleRange(min, max) {
    return min + Random().nextDouble() * (max - min);
  }
}
