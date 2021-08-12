import 'dart:convert';
// import 'package:fe_tare2k/net/endpoints.dart';
import 'package:fe_tare2k/Model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth auth = FirebaseAuth.instance;

class UserCaller {
  static Future<user> getProfile() async {
    String profile = auth.currentUser!.email.toString();
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/user/' + profile));
    if (response.statusCode == 200) {
      return user.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  UserCaller();
}
