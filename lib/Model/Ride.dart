import 'User.dart';

class Ride {
  String pickup;
  String destination;
  DateTime date;
  int passengers;
  int luggage;
  double price;

  Ride({
    required this.pickup,
    required this.destination,
    required this.date,
    required this.passengers,
    required this.luggage,
    required this.price,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
        pickup: json['pickup'],
        destination: json['destination'],
        date: json['date'],
        passengers: json['passengers'],
        luggage: json['luggage'],
        price: json['price']);
  }
}

enum Status {
  Completed,
  Cancelled,
  Pending,
  Upcoming,
}
