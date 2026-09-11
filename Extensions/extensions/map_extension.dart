extension MapExtension on Map<String, String> {
  Map<String, int> countMembersBySurname() {
    final memberCountBySurname = <String, int>{};

    for (var surname in values) {
      memberCountBySurname[surname] = (memberCountBySurname[surname] ?? 0) + 1;
    }

    return memberCountBySurname;
  }
}

