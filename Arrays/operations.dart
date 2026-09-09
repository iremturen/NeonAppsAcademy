import 'neon_academy_member.dart';
import 'contact_information.dart';

class Operations {
  //Delete the 3rd member.
  void removeAt(List<NeonAcademyMember> members, int index) {
    members.removeAt(index - 1);
  }

  //Rank the members according to their age from largest to smallest.
  void sortByAgeDesc(List<NeonAcademyMember> members) {
    members.sort((a, b) => b.age - a.age);
  }

  //Sort the members according to their names (Z-A).
  void sortByNameDesc(List<NeonAcademyMember> members) {
    members.sort((a, b) => b.fullName.compareTo(a.fullName));
  }

  /*
  Filter the members of the Academy who are older than 24 and transfer them to a new array. 
  Print the names of the members in this array.
  */
  void filterByAge(List<NeonAcademyMember> members, int age) {
    final memberArr = <NeonAcademyMember>[];
    for (var i = 0; i < members.length; i++) {
      if (members[i].age > age) 
        memberArr.add(members[i]);
    }
    printMembersName(memberArr);
  }

  //Print the total number of iOS Developers.
  void countByTitle(List<NeonAcademyMember> members, String title) {
    int count = 0;
    for (var i = 0; i < members.length; i++) {
      if (members[i].title == title) 
        count++;
    }
    print(count);
  }

  //Find which index you come across in the array and print it.
  int findIndexByName(List<NeonAcademyMember> members, String fullName) {
    for (var i = 0; i < members.length; i++) {
      if (members[i].fullName == fullName) 
        return i;
    }
    return -1;
  }

  /*
    Add a new member to the array, who is a mentor of the academy 
    and has a special property "mentorLevel"
    indicating their level of experience. Print out the full names of all members 
    after adding the new member.
  */
  void addMentor(List<NeonAcademyMember> members) {
    final contact = ContactInformation(
      email: "neonapps@gmail.com",
      phoneNumber: "5550005555",
    );

    final member = NeonAcademyMember(
      fullName: "Beyza Akyüz",
      title: "Academy Mentor",
      horoscope: "Taurus",
      memberLevel: "C1",
      mentorLevel: "Senior",
      homeTown: "Ankara",
      age: 45,
      contactInformation: contact,
    );

    members.add(member);
    printMembersName(members);
  }

  /*
    Remove all members who have a specific memberLevel, 
    for example, "A1", and print out the remaining members' full names.
  */
  void removeByMemberLevel(List<NeonAcademyMember> members, String memberLevel) {
    for (var i = 0; i < members.length; i++) {
      if (members[i].memberLevel == memberLevel) {
        members.remove(members[i]);
        i--;
      }
    }
    printMembersName(members);
  }

  //Find the member with the highest age and print out their full name and age.
  void findOldestMember(List<NeonAcademyMember> members) {
    var oldest = members[0];
    for (var i = 1; i < members.length; i++) {
      if (members[i].age > oldest.age) {
        oldest = members[i];
      }
    }
    print(oldest.fullName);
    print(oldest.age);
  }

  //Find the member with the longest name and print out their full name and the length of their name.
  void findLongestName(List<NeonAcademyMember> members) {
    int longest = 0;
    int idx = 0;
    for (var i = 0; i < members.length; i++) {
      int len = members[i].fullName.length;
      if (len > longest) {
        longest = len;
        idx = i;
      }
    }
    print(members[idx].fullName);
    print(members[idx].fullName.length);
  }

  /*
  Find all members who have the same horoscope sign 
  and group them together in a new array. 
  Print out the full names of members in this new array.
  */
  void findByHoroscope(List<NeonAcademyMember> members, String horoscope) {
    final memberArr = <NeonAcademyMember>[];
    for (var i = 0; i < members.length; i++) {
      if (members[i].horoscope == horoscope) memberArr.add(members[i]);
    }
    printMembersName(memberArr);
  }

  /*
  Find the most common hometown among the members 
  and print out the name of the town.
  */
  void findMostCommonHometown(List<NeonAcademyMember> members) {
      final List<String> hometownArray = [];
      final List<int> hometownIndex = [];

      for (var i = 0; i < members.length; i++) {
        String hometown = members[i].homeTown;
        if(hometownArray.contains(hometown)){
          int idx = hometownArray.indexOf(hometown);
          hometownIndex[idx]++;
        }else{
          hometownArray.add(hometown);
          hometownIndex.add(1);
        }
      }

    int maxIndex = 0;
    for (var i = 0; i < hometownIndex.length; i++) {
      if (hometownIndex[i] > hometownIndex[maxIndex]) {
        maxIndex = i;
      }
    }
    print(hometownArray[maxIndex]);
  }

  //Find the average age of all members and print out the result.
  void findAverageAge(List<NeonAcademyMember> members) {
    int total = 0;
    int numberOfMembers = members.length;

    for (var i = 0; i < members.length; i++) {
      total += members[i].age;
    }
    print(total / numberOfMembers);
  }

  /*
  Create a new array that contains only the contact information 
  of the members, and print out the email addresses of all members
  in this new array.
  */
  void getEmailInformations(List<NeonAcademyMember> members) {
    final contacts = <ContactInformation>[];
    for (var i = 0; i < members.length; i++)
      contacts.add(members[i].contactInformation);
    for (var i = 0; i < contacts.length; i++) {
      print(contacts[i].email);
    }
  }

  /*
  Sort the members according to their memberLevel 
  (highest to lowest) and print out their full names.
  */
  void sortByMemberLevel(List<NeonAcademyMember> members) {
    final memberLevels = [
      "A1","A2","A3","A4",
      "B1","B2","B3","B4",
      "C1","C2","C3","C4",
      "D1","D2","D3","D4",
    ];

    members.sort(
      (a, b) =>
          memberLevels.indexOf(b.memberLevel) -
          memberLevels.indexOf(a.memberLevel),
    );
    printMembersName(members);
  }

  /*
  Find all members who have the same title
  and create a new array of their contact information,
  then print out the phone numbers of all members in this new array.
  */
  void findByTitle(List<NeonAcademyMember> members, String title) {
    final contacts = <ContactInformation>[];
    for (var i = 0; i < members.length; i++) {
      if (members[i].title == title)
        contacts.add(members[i].contactInformation);
    }
    for (var i = 0; i < contacts.length; i++) {
      print(contacts[i].phoneNumber);
    }
  }

  //Print the full names of all members.
  void printMembersName(List<NeonAcademyMember> members) {
    for (var i = 0; i < members.length; i++) {
      print(members[i].fullName);
    }
  }
}
