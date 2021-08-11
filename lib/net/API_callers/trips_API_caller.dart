import 'dart:convert';
// import 'package:fe_tare2k/net/endpoints.dart';
import 'package:fe_tare2k/Model/Ride.dart';
import 'package:fe_tare2k/Model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth auth = FirebaseAuth.instance;

class TripCaller {
  static Future<List> getTripInfo() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/ride/rides/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.toList();
    } else {
      throw Exception('Failed to load rides');
    }
  }

  TripCaller();
}
