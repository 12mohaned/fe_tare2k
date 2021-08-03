class user {
  String firstName;
  String lastName;
  String email;
  int phoneNumber;

  user(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});

  factory user.fromJson(Map<String, dynamic> json) => user(
        firstName: json['firstname'],
        lastName: json['lastname'],
        email: json['email'],
        phoneNumber: json['phone'],
      );
}
