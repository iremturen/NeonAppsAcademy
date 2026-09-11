extension IntExtension on int {
  bool isPrime() {
    int i = 3;

    if (this < 2) 
      return false;
    if (this == 2) 
      return true;
    if (this % 2 == 0) 
      return false;
    while (i * i <= this) {
      if (this % i == 0) 
        return false;
      i += 2;
    }
    return true;
  }
}
