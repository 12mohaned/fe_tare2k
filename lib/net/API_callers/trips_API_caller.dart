import 'dart:convert';
// import 'package:fe_tare2k/net/endpoints.dart';
import 'package:fe_tare2k/Model/Ride.dart';
import 'package:fe_tare2k/Model/Profile.dart';
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

  static Future<List> getPastTrips() async {
    String profile = auth.currentUser!.email.toString();
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/ride/pastrides/' + profile));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.toList();
    } else {
      throw Exception('Failed to load past rides');
    }
  }

  static Future<Ride> publishRide(String pickup, String destination,
      DateTime date, int passengers, double price) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/ride/Addride'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'pickup': pickup,
        'destination': destination,
        'date': date.toIso8601String(),
        'passengers': passengers,
        'price': price,
        'email': auth.currentUser!.email.toString(),
      }),
    );

    if (response.statusCode == 201) {
      return Ride.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Un able to create a trip");
    }
  }

  static Future<List> findTrips(
      String Pickup, String Destination, DateTime date, int passengers) async {
    var requestParam = new Map();
    requestParam['Pickup'] = Pickup;
    requestParam['Destination'] = Destination;
    requestParam['date'] = date.toIso8601String();
    requestParam['passengers'] = passengers.toString();

    final response = await http.get(Uri.parse(
        'http://10.0.2.2:8080/ride/rides/' +
            requestParam['Pickup'] +
            "/" +
            requestParam['Destination'] +
            "/" +
            requestParam['date'] +
            "/" +
            requestParam['passengers']));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.toList();
    } else {
      throw Exception('Failed to load rides');
    }
  }

  TripCaller();
}
