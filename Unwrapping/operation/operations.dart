import '../model/neon_academy_member.dart';

class Operations {
  /*
  Sets motivation level to 1 if null, 
  otherwise increases it by the given number.
  */
  void increaseMotivation(NeonAcademyMember member, int number) {
    if (member.motivationLevel == null)
      member.motivationLevel = 1;
    else
      member.motivationLevel = member.motivationLevel! + number;
  }

  /*
  Create a function that prints out a message
  based on the member's motivation level.
  */
  void printMessageByMotivationLevel(NeonAcademyMember member) {
    if (member.motivationLevel == null) {
      print("This member has no motivation level set.");
      return;
    }

    final motivationLevel = member.motivationLevel!;
    if (motivationLevel > 5)
      print("This member is highly motivated.");
    else
      print("This member is moderately motivated.");
  }

  /*
  Create a function that takes a member's motivation level
  as an input and returns a string indicating
  whether the member is highly motivated,
  moderately motivated, or not motivated at all.
  */
  String getMotivationLevelMessage(int motivationLevel) {
    if (motivationLevel > 5) {
      return "highly motivated";
    } else if (motivationLevel == 0) {
      return "not motivated at all";
    } else {
      return "moderately motivated";
    }
  }

  /*
  Create a function that takes a member 
  and returns the member's motivation level if it is not nil,
  otherwise it returns 0.
  */
  int getMotivationLevel(NeonAcademyMember member) {
    return member.motivationLevel ?? 0;
  }

  /*
  Create a function that takes a member and a target motivation level 
  as inputs, and returns true if the member's current motivation level 
  is greater than or equal to the target level, or false otherwise. 
  */
  bool isMotivationLevelEnough(NeonAcademyMember member, int target) {
    if (member.motivationLevel != null) {
      return member.motivationLevel! >= target;
    }
    return false;
  }
}
