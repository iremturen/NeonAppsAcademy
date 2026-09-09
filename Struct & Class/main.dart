class ContactInformation {
  String phoneNumber;
  String email;

  ContactInformation({required this.phoneNumber, required this.email});
}

class NeonAcademyMember {
  String fullName;
  String title;
  String horoscope;
  String memberLevel;
  String homeTown;
  int age;
  ContactInformation contactInformation;

  NeonAcademyMember({
    required this.fullName,
    required this.title,
    required this.horoscope,
    required this.memberLevel,
    required this.homeTown,
    required this.age,
    required this.contactInformation,
  });
}

void main() {
  final contact1 = ContactInformation(
    phoneNumber: "5075824848",
    email: "irem@gmail.com",
  );

  final contact2 = ContactInformation(
    phoneNumber: "5551112233",
    email: "zehra@gmail.com",
  );

  final contact3 = ContactInformation(
    phoneNumber: "5552223344",
    email: "mehmet@gmail.com",
  );

  final member1 = NeonAcademyMember(
    fullName: "İrem Türen",
    title: "Flutter Developer",
    horoscope: "Aries",
    memberLevel: "A1",
    homeTown: "Istanbul",
    age: 26,
    contactInformation: contact1,
  );

  final member2 = NeonAcademyMember(
    fullName: "Zehra Nur Baş",
    title: "Flutter Developer",
    horoscope: "Gemini",
    memberLevel: "A2",
    homeTown: "Istanbul",
    age: 25,
    contactInformation: contact2,
  );

  final member3 = NeonAcademyMember(
    fullName: "Mehmet Nuri Fırat",
    title: "Flutter Developer",
    horoscope: "Virgo",
    memberLevel: "C1",
    homeTown: "Istanbul",
    age: 28,
    contactInformation: contact3,
  );

  final members = <NeonAcademyMember>[member1,];
  members.add(member1);
  members.add(member2);
  members.add(member3);
}
