import 'package:flutter/material.dart';

class RequestRidePage extends StatefulWidget {
  RequestRidePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RequestRideState createState() => _RequestRideState();
}

class _RequestRideState extends State<RequestRidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: Color.fromRGBO(33, 114, 243, 1),
        ),
        body: Center(
            child: ListView.builder(
                itemBuilder: (_, __) => (DriverInformation()), itemCount: 10)));
  }
}

class DriverInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimension = MediaQuery.of(context);

    return Container(
        width: deviceDimension.size.width / 5,
        height: deviceDimension.size.height / 5,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Mohaned Mashaly'),
                subtitle: Text(
                    'Mohaned is a friendly driver who loves cars, animals and chocolate '),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Pickup'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_right_alt_sharp),
                  SizedBox(width: 10),
                  Text('Destination'),
                  TextButton(
                    child: Text('Select'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
