class UserModel {
  final int? id;
  final String name;
  final String surname;
  final int age;
  final String email;
  final String? address;

  const UserModel({
    this.id,
    required this.name,
    required this.surname,
    required this.age,
    required this.email,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'age': age,
      'email': email,
      'address': address,
    };
  }
}