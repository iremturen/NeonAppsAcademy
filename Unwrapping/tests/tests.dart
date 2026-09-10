import '../data/mock_member.dart';
import '../operation/operations.dart';

class Tests {
  final operations = Operations();
  final members = mockMembers;

  void testIncreaseMotivation() {
    printColored("\n--- Test increaseMotivation ---");

    print("Before: ${members[0].motivationLevel}");

    operations.increaseMotivation(members[0], 3);
    print("After first increase: ${members[0].motivationLevel}");

    operations.increaseMotivation(members[0], 3);
    print("After second increase: ${members[0].motivationLevel}");
  }

  void testPrintMessageByMotivationLevel() {
    printColored("\n--- Test printMessageByMotivationLevel ---");
    print("Null level:");
    operations.printMessageByMotivationLevel(member1);

    print("Moderate level:");
    operations.printMessageByMotivationLevel(member2);

    print("High level:");
    operations.printMessageByMotivationLevel(member3);
  }

  void testGetMotivationLevelMessage() {
    printColored("\n--- Test getMotivationLevelMessage ---");
    print("Level 7: ${operations.getMotivationLevelMessage(7)}");
    print("Level 3: ${operations.getMotivationLevelMessage(3)}");
    print("Level 0: ${operations.getMotivationLevelMessage(0)}");
  }

  void testGetMotivationLevel() {
    printColored("\n--- Test getMotivationLevel ---");
    print(" ${members[0].fullName}: - ${operations.getMotivationLevel(members[0])}");
    print(" ${members[5].fullName}: - ${operations.getMotivationLevel(members[5])}",);
    print(" ${members[7].fullName}: - ${operations.getMotivationLevel(members[7])}",);
  }

  void testIsMotivationLevelEnough() {
    printColored("\n--- Test isMotivationLevelEnough ---");
    int target = 5;

    print("Motivation Level: ${members[4].motivationLevel} - Target: ${target}");
    print(operations.isMotivationLevelEnough(members[4], target));

    print("Motivation Level: ${members[5].motivationLevel} Target: ${target}");
    print(operations.isMotivationLevelEnough(members[5], target));
  
    print("Motivation Level: ${members[1].motivationLevel} Target: ${target}");
    print(operations.isMotivationLevelEnough(members[1], target));

    print("Motivation Level: ${members[0].motivationLevel} Target: ${target}");
    print(operations.isMotivationLevelEnough(members[0], target));
  
  }

  void runAll(){
    testGetMotivationLevel();
    testGetMotivationLevelMessage();
    testIsMotivationLevelEnough();
    testPrintMessageByMotivationLevel();
    testIncreaseMotivation();
  }

  void printColored(String text) {
    const pink = '\x1B[95m';
    const reset = '\x1B[0m';
    print('$pink$text$reset');
  }

}
