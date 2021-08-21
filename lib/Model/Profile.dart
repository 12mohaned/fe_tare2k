class Profile {
  String firstName;
  String lastName;
  String email;
  int phoneNumber;

  Profile(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        firstName: json['firstname'],
        lastName: json['lastname'],
        email: json['email'],
        phoneNumber: json['phone'],
      );
}
