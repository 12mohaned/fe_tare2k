enum EndPoint {
  ProfileInfo,
  AvailableRides,
  PastTrips,
  UpcomingTrips,
  ReserveTrip,
  AddRide,
  SearchForRide,
  ResetPassword,
  ForgetPassword,
}
final host = 'http://127.0.0.1:8080';

class APIRouting {
  static String mapToString(EndPoint request) {
    switch (request) {
      case EndPoint.ProfileInfo:
        return host + '/user/id';

      case EndPoint.ForgetPassword:
        return host + '/forget';

      case EndPoint.ResetPassword:
        return host + '/reset';

      case EndPoint.AvailableRides:
        return host + '/ride/rides';

      case EndPoint.PastTrips:
        return host + '/ride/pastrides/id';

      case EndPoint.UpcomingTrips:
        return host + '/ride/id';

      default:
        return 'url not found';
    }
  }
}
