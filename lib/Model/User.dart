class user {
  String uid;
  String firstName;
  String lastName;
  String email;
  late String bio;
  String password;
  int phoneNumber;

  user(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phoneNumber});
}
