import 'User.dart';

class Ride {
  String pickup;
  String destination;
  String date;
  int passengers;
  int luggage;
  double price;
  String time;

  Ride(
      {required this.pickup,
      required this.destination,
      required this.date,
      required this.passengers,
      required this.luggage,
      required this.price,
      required this.time,
      });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
        pickup: json['pickup'],
        destination: json['destination'],
        date: json['date'],
        passengers: json['passengers'],
        luggage: json['luggage'],
        price: json['price'],
        time: json['time']);
  }
}

enum Status {
  Completed,
  Cancelled,
  Pending,
  Upcoming,
}
