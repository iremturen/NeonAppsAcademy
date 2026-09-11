extension ComplaintListExtension on List<String> {
  // Removes duplicate complaints and returns a Set containing unique complaints.
  Set<String> removeDuplicateComplaints() {
    return toSet();
  }
}
