import 'contact_information.dart';
import 'team.dart';

class NeonAcademyMember {
  String fullName;
  String title;
  String horoscope;
  String memberLevel;
  String? mentorLevel;
  String homeTown;
  int age;
  ContactInformation contactInformation;
  Team team;

  NeonAcademyMember({
    required this.fullName,
    required this.title,
    required this.horoscope,
    required this.memberLevel,
    this.mentorLevel,
    required this.homeTown,
    required this.age,
    required this.contactInformation,
    required this.team,
  });
}
