class ProfileModel {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String phone;
  final String image;
  final String? gender;

  ProfileModel({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.phone,
    required this.image,
    required this.gender,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'] ?? "",
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      email: json['email'] ?? "",
      username: json['username'] ?? "",
      phone: json['phone'] ?? "",
      image: json['image'] ?? "",
      gender: json['gender'],
    );
  }
}