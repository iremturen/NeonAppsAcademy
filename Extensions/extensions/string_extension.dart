extension StringExtension on String {
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
