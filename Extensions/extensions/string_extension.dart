extension StringExtension on String {
  // Checks whether the string reads the same forwards and backwards.
  bool isPalindrome() {
    final normalized = toLowerCase().replaceAll(RegExp(r'[^a-z0-9çğıöşü]'), '');
    int len = normalized.length;
    int i = 0;
    int j = len - 1;

    while (i < j) {
      if (normalized[i] != normalized[j]) 
        return false;
      i++;
      j--;
    }
    return true;
  }
}
