class User {
  String name;
  String description;
  String gender;
  String birthday;
  String address;
  String phone;
  String email;

  User({
    required this.name,
    required this.description,
    required this.gender,
    required this.birthday, // Add initializer for 'birthday' field
    required this.address,
    required this.phone,
    required this.email, // Add initializer for 'email' field
  });
}
