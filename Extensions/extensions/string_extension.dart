extension StringExtension on String {
  bool isPalindrome() {
    int len = this.length;
    int i = 0;
    int j = len - 1;

    while (i < j) {
      if (this[i] != this[j]) 
        return false;
      i++;
      j--;
    }
    return true;
  }
}
