extension DateTimeExtension on DateTime {
  // Returns the number of days between this date and the other date.
  int daysBetween(DateTime other) {
    return other.difference(this).inDays;
  }
}
