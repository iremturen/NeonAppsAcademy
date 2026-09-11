extension MapExtension on Map<String, String> {
  // Counts how many members have each surname.
  Map<String, int> countMembersBySurname() {
    final memberCountBySurname = <String, int>{};

    for (var surname in values) {
      memberCountBySurname[surname] = (memberCountBySurname[surname] ?? 0) + 1;
    }

    return memberCountBySurname;
  }
}
