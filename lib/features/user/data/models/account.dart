import 'package:event_app/features/user/data/models/profile.dart';

class Account {
  final String name;
  final String email;
  final String password;
  final Profile profile;
  final String role;

  Account(
      {required this.profile,
      required this.name,
      required this.email,
      required this.password,
      required this.role});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        profile: Profile.fromJson(json['profile']),
        name: json['name'],
        email: json['email'],
        password: json['password'],
        role: 'admin');
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile.toJson(),
      'name': name,
      'email': email,
      'password': password,
      'role': role
    };
  }
}
