import 'User.dart';

class Ride {
  String pickup;
  String destination;
  String date;
  int passengers;
  int luggage;
  double price;
  String time;
  user User;
  Status tripStatus;

  Ride(
      {required this.pickup,
      required this.destination,
      required this.date,
      required this.passengers,
      required this.luggage,
      required this.price,
      required this.time,
      required this.User,
      required this.tripStatus});
}

enum Status {
  Completed,
  Cancelled,
  Pending,
  Upcoming,
}
