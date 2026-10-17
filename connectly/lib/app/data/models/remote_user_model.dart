class RemoteUserModel {
  final int id;
  final String name;
  final String email;
  final String phone;

  const RemoteUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory RemoteUserModel.fromJson(Map<String, dynamic> json) {
    return RemoteUserModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );
  }
}