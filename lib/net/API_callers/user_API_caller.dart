import 'dart:convert';
// import 'package:fe_tare2k/net/endpoints.dart';
import 'package:fe_tare2k/Model/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth auth = FirebaseAuth.instance;
String id = auth.currentUser!.email.toString();

class UserCaller {
  static Future<Profile> getProfile() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/user/' + id));
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<Profile> addUser(
      String firstname, String lastname, String email, int phone) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/user/Adduser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
      }),
    );
    if (response.statusCode == 201) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Un able to create a trip");
    }
  }

  static Future<Profile> updateProfile(
      String firstname, String lastname, String email, int phone) async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:8080/user/User/' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
      }),
    );
    print(response);
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }

  UserCaller();
}
