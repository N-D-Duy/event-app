class Account {
  final String name;
  final String email;
  final String password;
  final String role;

  Account(
      {
      required this.name,
      required this.email,
      required this.password,
      required this.role});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        role: 'admin');
  }

  Map<String, dynamic> toJson() {
    return {

      'name': name,
      'email': email,
      'password': password,
      'role': role
    };
  }
}
