import '../model/neon_academy_member.dart';
import '../model/team.dart';
import '../model/contact_information.dart';

class Operations {
  /*
  Create a new array that contains only the members of the Flutter Development Team
  and print out their full names.
  */
  void getFlutterTeamMembers(List<NeonAcademyMember> members) {
    final teamMembers = <NeonAcademyMember>[];
    for (var i = 0; i < members.length; i++) {
      if (members[i].team == Team.flutterDevelopment)
        teamMembers.add(members[i]);
    }
    printMembersName(teamMembers);
  }

  /*
  Create a dictionary that contains the number of members in each team, 
  and print out the number of members in the UI/UX Design Team.
  */
  void countMembersByTeam(List<NeonAcademyMember> members) {
    final teamCounts = <Team, int>{
      Team.flutterDevelopment: 0,
      Team.iosDevelopment: 0,
      Team.androidDevelopment: 0,
      Team.uiUxDesign: 0,
    };

    for (var member in members) {
      switch (member.team) {
        case Team.flutterDevelopment:
          teamCounts[Team.flutterDevelopment] =
              teamCounts[Team.flutterDevelopment]! + 1;
        case Team.iosDevelopment:
          teamCounts[Team.iosDevelopment] =
              teamCounts[Team.iosDevelopment]! + 1;
        case Team.androidDevelopment:
          teamCounts[Team.androidDevelopment] =
              teamCounts[Team.androidDevelopment]! + 1;
        case Team.uiUxDesign:
          teamCounts[Team.uiUxDesign] = teamCounts[Team.uiUxDesign]! + 1;
      }
    }
    print(teamCounts[Team.uiUxDesign]);
  }

  /*
    Create a function that takes a team as an input 
    and prints out the full names of all members in that team.
    */
  void getTeamMembers(List<NeonAcademyMember> members, Team team) {
    final teamMembers = <NeonAcademyMember>[];
    for (var i = 0; i < members.length; i++) {
      if (members[i].team == team) teamMembers.add(members[i]);
    }
    printMembersName(teamMembers);
  }

  //Create a switch statement that performs different actions based on the team of a member.
  void printTeamAction(NeonAcademyMember member) {
    switch (member.team) {
      case Team.androidDevelopment:
        print("This member is a skilled Android developer.");
        break;
      case Team.flutterDevelopment:
        print("This member is a skilled Flutter developer.");
        break;
      case Team.iosDevelopment:
        print("This member is a skilled iOS developer.");
        break;
      case Team.uiUxDesign:
        print("This member is a talented designer.");
        break;
    }
  }

  /*
    Create a function that takes an age as an input
    and prints out the full names of all members
    that are older than that age and belong to a specific team.
  */
  void getMembersByAgeAndTeam(
    List<NeonAcademyMember> members,
    int age,
    Team team,
  ) {
    for (var member in members) {
      if (member.age > age && member.team == team) print(member.fullName);
    }
  }

  //Create a switch statement that gives a promotion to a member based on their team.
  void promoteMember(NeonAcademyMember member) {
    switch (member.team) {
      case Team.flutterDevelopment:
        member.title = "Senior Flutter Developer";
        break;

      case Team.iosDevelopment:
        member.title = "Senior iOS Developer";
        break;

      case Team.androidDevelopment:
        member.title = "Senior Android Developer";
        break;

      case Team.uiUxDesign:
        member.title = "Lead Designer";
        break;
    }
    member.memberLevel = "C1";
  }

  /*
  Create a function that takes a team as an input 
  and calculates the average age of the members in that team.
  */
  double calculateAverageAgeByTeam(List<NeonAcademyMember> members, Team team) {
    int sum = 0;
    int numberOfMembers = 0;

    for (var member in members) {
      if (member.team == team) {
        sum += member.age;
        numberOfMembers++;
      }
    }
    return numberOfMembers == 0 ? 0 : sum / numberOfMembers;
  }

  //Create a switch statement that prints out a different message for each team.
  void printMessageByTeam(NeonAcademyMember member) {
    switch (member.team) {
      case Team.androidDevelopment:
        print("The Android Development Team is the engine of our academy.");
        break;

      case Team.flutterDevelopment:
        print("The Flutter Development Team is the backbone of our academy.");
        break;

      case Team.iosDevelopment:
        print("The iOS Development Team is the innovation of our academy.");
        break;

      case Team.uiUxDesign:
        print("The UI/UX Design Team is the face of our academy.");
        break;
    }
  }

  /*
  Create a function that takes a team as an input
  and returns an array of the contact information of all members in that team.
  */
  List<ContactInformation> getContactInformationByTeam(
    List<NeonAcademyMember> members,
    Team team,
  ) {
    final contact = <ContactInformation>[];
    for (var member in members) {
      if (member.team == team) contact.add(member.contactInformation);
    }
    return contact;
  }

  //Create a switch statement that performs different actions based on the team of a member and their age.
  void printTeamAndAgeAction(NeonAcademyMember member) {
    switch (member.team) {
      case Team.flutterDevelopment:
        if (member.age > 23) {
          print("${member.fullName} member is a seasoned Flutter developer.");
        } else {
          print("${member.fullName} member is a rising Flutter developer.");
        }
        break;

      case Team.uiUxDesign:
        if (member.age < 24) {
          print(
            "${member.fullName} member is a rising star in the design world.",
          );
        } else {
          print("${member.fullName} member is an experienced designer.");
        }
        break;

      case Team.iosDevelopment:
        if (member.age > 25) {
          print("${member.fullName} member is an experienced iOS developer.");
        } else {
          print("${member.fullName} member is a promising iOS developer.");
        }
        break;

      case Team.androidDevelopment:
        if (member.age > 25) {
          print(
            "${member.fullName} member is an experienced Android developer.",
          );
        } else {
          print("${member.fullName} member is a promising Android developer.");
        }
        break;
    }
  }

  //Print the full names of all members.
  void printMembersName(List<NeonAcademyMember> members) {
    for (var i = 0; i < members.length; i++) {
      print(members[i].fullName);
    }
  }
}
