import 'tests.dart';

void main() {
  final tests = Tests();

  tests.testRemoveAt();
  tests.testSortByAgeDesc();
  tests.testSortByNameDesc();
  tests.testFilterByAge();
  tests.testCountByTitle();
  tests.testFindIndexByName();
  tests.testAddMentor();
  tests.testRemoveByMemberLevel();
  tests.testFindOldestMember();
  tests.testFindLongestName();
  tests.testFindByHoroscope();
  tests.testFindMostCommonHometown();
  tests.testFindAverageAge();
  tests.testGetEmailInformations();
  tests.testSortByMemberLevel();
  tests.testFindByTitle();
}
