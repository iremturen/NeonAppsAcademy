import '../model/neon_academy_member.dart';
import '../model/contact_information.dart';
import '../model/team.dart';

final contact1 = ContactInformation(
  phoneNumber: "5001112233",
  email: "irem@example.com",
);

final contact2 = ContactInformation(
  phoneNumber: "5002223344",
  email: "zehra@example.com",
);

final contact3 = ContactInformation(
  phoneNumber: "5003334455",
  email: "mehmet@example.com",
);

final contact4 = ContactInformation(
  phoneNumber: "5004445566",
  email: "elif@example.com",
);

final contact5 = ContactInformation(
  phoneNumber: "5005556677",
  email: "mert@example.com",
);

final contact6 = ContactInformation(
  phoneNumber: "5006667788",
  email: "selin@example.com",
);

final contact7 = ContactInformation(
  phoneNumber: "5007778899",
  email: "can@example.com",
);

final contact8 = ContactInformation(
  phoneNumber: "5008889900",
  email: "derya@example.com",
);

final member1 = NeonAcademyMember(
  fullName: "Irem Türen",
  title: "Flutter Developer",
  horoscope: "Aries",
  memberLevel: "A1",
  homeTown: "Istanbul",
  age: 16,
  contactInformation: contact1,
  team: Team.flutterDevelopment,
);

final member2 = NeonAcademyMember(
  fullName: "Zehra Nur Baş",
  title: "Flutter Developer",
  horoscope: "Gemini",
  memberLevel: "A2",
  homeTown: "Ankara",
  age: 25,
  contactInformation: contact2,
  team: Team.flutterDevelopment,
  motivationLevel: 3,
);

final member3 = NeonAcademyMember(
  fullName: "Mehmet Nuri Fırat",
  title: "Flutter Developer",
  horoscope: "Virgo",
  memberLevel: "C1",
  homeTown: "Istanbul",
  age: 28,
  contactInformation: contact3,
  team: Team.flutterDevelopment,
  motivationLevel: 7,
);

final member4 = NeonAcademyMember(
  fullName: "Elif Karaca",
  title: "UI/UX Designer",
  horoscope: "Leo",
  memberLevel: "A1",
  homeTown: "Izmir",
  age: 23,
  contactInformation: contact4,
  team: Team.uiUxDesign,
  motivationLevel: 0,
);

final member5 = NeonAcademyMember(
  fullName: "Mert Kaya",
  title: "iOS Developer",
  horoscope: "Gemini",
  memberLevel: "B2",
  homeTown: "Ankara",
  age: 31,
  contactInformation: contact5,
  team: Team.iosDevelopment,
  motivationLevel: 5,
);

final member6 = NeonAcademyMember(
  fullName: "Selin Aksoy",
  title: "iOS Developer",
  horoscope: "Leo",
  memberLevel: "A2",
  homeTown: "Bursa",
  age: 22,
  contactInformation: contact6,
  team: Team.iosDevelopment,
  motivationLevel: 6,
);

final member7 = NeonAcademyMember(
  fullName: "Can Demir",
  title: "Flutter Developer",
  horoscope: "Aries",
  memberLevel: "B1",
  homeTown: "Ankara",
  age: 27,
  contactInformation: contact7,
  team: Team.flutterDevelopment,
  motivationLevel: 2,
);

final member8 = NeonAcademyMember(
  fullName: "Derya Şahin",
  title: "Flutter Developer",
  horoscope: "Leo",
  memberLevel: "A1",
  homeTown: "Istanbul",
  age: 24,
  contactInformation: contact8,
  team: Team.flutterDevelopment,
  motivationLevel: 8,
);

final mockMembers = [
  member1,
  member2,
  member3,
  member4,
  member5,
  member6,
  member7,
  member8,
];
