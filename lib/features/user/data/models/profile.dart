class Profile {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatar;
  final String gender;

  Profile(
      {required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.avatar,
      required this.gender});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        avatar: json['avatar'],
        gender: json['gender']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'avatar': avatar,
      'gender': gender
    };
  }
}
