import 'package:titanic_passengers/data/enum/team.dart';

class PassengerModel {
  final String name;
  final String surname;
  final Team team;
  final int age;
  final String hometown;
  final String mail;

  const PassengerModel({
    required this.name,
    required this.surname,
    required this.team,
    required this.age,
    required this.hometown,
    required this.mail,
  });
}

