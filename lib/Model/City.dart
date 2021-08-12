import 'dart:convert';

import 'package:flutter/services.dart';

class City {
  String name;
  double lat;
  double long;
  City({
    required this.name,
    required this.lat,
    required this.long,
  });

  factory City.fromJson(Map<String, dynamic> parsedJson) {
    return City(
        name: parsedJson['name'],
        lat : parsedJson['lat'],
        long : parsedJson['lon']
    );
  }
}

