extension BoolExtension on bool {
  bool and(bool other) {
    return this && other;
  }

  bool or(bool other) {
    return this || other;
  }

  bool not() {
    return !this;
  }

  bool xor(bool other) {
    return this != other;
  }
}
