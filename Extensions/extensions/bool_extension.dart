extension BoolExtension on bool {
  // Returns true if both this value and the other value are true.
  bool and(bool other) {
    return this && other;
  }

  // Returns true if at least one of the values is true.
  bool or(bool other) {
    return this || other;
  }

  // Reverses the boolean value.
  bool not() {
    return !this;
  }

  // Returns true if the two boolean values are different.
  bool xor(bool other) {
    return this != other;
  }
}
