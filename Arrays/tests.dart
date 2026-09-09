import 'operations.dart';
import 'neon_academy_member.dart';
import 'mock_member.dart';

class Tests {
  final Operations operations = Operations();

  List<NeonAcademyMember> resetMembers() {
    return List<NeonAcademyMember>.from(mockMembers);
  }

  void printTestHeader(String title) {
    print("\n════════════════════════════════════════");
    print(title);
    print("════════════════════════════════════════");
  }

  void printBefore() {
    print("\nBEFORE:");
  }

  void printAfter() {
    print("\nAFTER:");
  }

  void printResult() {
    print("\nRESULT:");
  }

  void testRemoveAt() {
    final members = resetMembers();

    printTestHeader("TEST 01 - DELETE 3RD MEMBER");

    printBefore();
    operations.printMembersName(members);

    operations.removeAt(members, 3);

    printAfter();
    operations.printMembersName(members);
  }

  void testSortByAgeDesc() {
    final members = resetMembers();

    printTestHeader("TEST 02 - SORT BY AGE (DESCENDING)");

    printBefore();
    operations.printMembersName(members);

    operations.sortByAgeDesc(members);

    printAfter();
    operations.printMembersName(members);
  }

  void testSortByNameDesc() {
    final members = resetMembers();

    printTestHeader("TEST 03 - SORT BY NAME (Z-A)");

    printBefore();
    operations.printMembersName(members);

    operations.sortByNameDesc(members);

    printAfter();
    operations.printMembersName(members);
  }

  void testFilterByAge() {
    final members = resetMembers();

    printTestHeader("TEST 04 - FILTER MEMBERS OLDER THAN 24");

    printBefore();
    operations.printMembersName(members);

    printResult();
    operations.filterByAge(members, 24);
  }

  void testCountByTitle() {
    final members = resetMembers();

    printTestHeader("TEST 05 - COUNT iOS DEVELOPERS");

    printResult();
    operations.countByTitle(members, "iOS Developer");
  }

  void testFindIndexByName() {
    final members = resetMembers();

    printTestHeader("TEST 06 - FIND MEMBER INDEX");

    printBefore();
    operations.printMembersName(members);

    final idx = operations.findIndexByName(members, "Irem Türen");

    printResult();
    print("Index: $idx");
  }

  void testAddMentor() {
    final members = resetMembers();

    printTestHeader("TEST 07 - ADD ACADEMY MENTOR");

    printBefore();
    operations.printMembersName(members);

    printAfter();
    operations.addMentor(members);

  }

  void testRemoveByMemberLevel() {
    final members = resetMembers();

    printTestHeader("TEST 08 - REMOVE MEMBERS BY LEVEL");

    printBefore();
    operations.printMembersName(members);

    printAfter();
    operations.removeByMemberLevel(members, "A1");
  }

  void testFindOldestMember() {
    final members = resetMembers();

    printTestHeader("TEST 09 - FIND OLDEST MEMBER");

    printResult();
    operations.findOldestMember(members);
  }

  void testFindLongestName() {
    final members = resetMembers();

    printTestHeader("TEST 10 - FIND LONGEST NAME");

    printResult();
    operations.findLongestName(members);
  }

  void testFindByHoroscope() {
    final members = resetMembers();

    printTestHeader("TEST 11 - FIND MEMBERS BY HOROSCOPE");

    printResult();
    operations.findByHoroscope(members, "Aries");
  }

  void testFindMostCommonHometown() {
    final members = resetMembers();

    printTestHeader("TEST 12 - FIND MOST COMMON HOMETOWN");

    printResult();
    operations.findMostCommonHometown(members);
  }

  void testFindAverageAge() {
    final members = resetMembers();

    printTestHeader("TEST 13 - CALCULATE AVERAGE AGE");

    printResult();
    operations.findAverageAge(members);
  }

  void testGetEmailInformations() {
    final members = resetMembers();

    printTestHeader("TEST 14 - GET EMAIL INFORMATIONS");

    printBefore();
    operations.printMembersName(members);

    printResult();
    operations.getEmailInformations(members);
  }

  void testSortByMemberLevel() {
    final members = resetMembers();

    printTestHeader("TEST 15 - SORT BY MEMBER LEVEL");

    printBefore();
    operations.printMembersName(members);

    printAfter();
    operations.sortByMemberLevel(members);
  }

  void testFindByTitle() {
    final members = resetMembers();

    printTestHeader("TEST 16 - FIND CONTACTS BY TITLE");

    printResult();
    operations.findByTitle(members, "Flutter Developer");
  }
}
