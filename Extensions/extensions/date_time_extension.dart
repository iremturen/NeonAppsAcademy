extension DateTimeExtension on DateTime {
  int daysBetween(DateTime other) {
    return other.difference(this).inDays;
  }
}
