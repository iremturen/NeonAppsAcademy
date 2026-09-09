import '../model/team.dart';
import '../operation/operations.dart';
import '../data/mock_member.dart';

class Tests {
  final operations = Operations();
  final members = mockMembers;

  void testGetFlutterTeamMembers() {
    print("\n--- Test 1: Flutter Team Members ---");
    operations.getFlutterTeamMembers(members);
  }

  void testCountMembersByTeam() {
    print("\n--- Test 2: Number of Members in the UI/UX Design Team ---");
    operations.countMembersByTeam(members);
  }

  void testGetTeamMembers() {
    print("\n--- Test 3: Get Team Members By Team ---");
    operations.getTeamMembers(members, Team.flutterDevelopment);
  }

  void testPrintTeamAction() {
    print("\n--- Test 4: Print Team Action ---");
    operations.printTeamAction(members[0]);
  }

  void testGetMembersByAgeAndTeam() {
    print("\n--- Test 5: Members By Age And Team ---");
    operations.getMembersByAgeAndTeam(members, 23, Team.flutterDevelopment);
  }

  void testPromoteMember() {
    print("\n--- Test 6: Promote Member ---");
    print(
      "Before: ${members[0].fullName} - ${members[0].title} - ${members[0].memberLevel}",
    );
    operations.promoteMember(members[0]);
    print(
      "After: ${members[0].fullName} - ${members[0].title} - ${members[0].memberLevel}",
    );
    print("Congrats !!");
  }

  void testCalculateAverageAgeByTeam() {
    print("\n--- Test 7: Average Age By Team ---");
    final averageAge = operations.calculateAverageAgeByTeam(
      members,
      Team.flutterDevelopment,
    );
    print("Average Age: $averageAge");
  }

  void testPrintMessageByTeam() {
    print("\n--- Test 8: Message By Team ---");
    operations.printMessageByTeam(members[0]);
  }

  void testGetContactInformationByTeam() {
    print("\n--- Test 9: Contact Information By Team ---");

    final contacts = operations.getContactInformationByTeam(
      members,
      Team.flutterDevelopment,
    );
    print("Number of contacts: ${contacts.length}");

    for (var contact in contacts) {
      print(contact.email);
      print(contact.phoneNumber);
    }
  }

  void testPrintTeamAndAgeAction() {
    print("\n--- Test 10: Team And Age Action ---");
    operations.printTeamAndAgeAction(members[0]);
  }

  void runAllTests() {
    testGetFlutterTeamMembers();
    testCountMembersByTeam();
    testGetTeamMembers();
    testPrintTeamAction();
    testGetMembersByAgeAndTeam();
    testPromoteMember();
    testCalculateAverageAgeByTeam();
    testPrintMessageByTeam();
    testGetContactInformationByTeam();
    testPrintTeamAndAgeAction();
  }
}
