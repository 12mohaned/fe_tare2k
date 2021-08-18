import 'dart:convert';
// import 'package:fe_tare2k/net/endpoints.dart';

import 'package:fe_tare2k/Model/City.dart';
import 'package:http/http.dart' as http;

class CityCaller {
  static Future<List<City>> getCitiesInfo(String query) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/city/cities/'));
    if (response.statusCode == 200) {
      List cities = json.decode(response.body);
      return cities.map((json) => City.fromJson(json)).where((city) {
        final cityLower = city.name.toLowerCase();
        final querylower = query.toLowerCase();
        return cityLower.contains(querylower);
      }).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }

  static Future<List> getCities() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/city/cities/'));
    if (response.statusCode == 200) {
      List cities = json.decode(response.body);
      return cities;
    } else {
      throw Exception('Failed to load cities');
    }
  }

  CityCaller();
}
