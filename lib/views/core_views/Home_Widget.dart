import 'package:flutter/material.dart';

class MyRidePage extends StatefulWidget {
  MyRidePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyRidePageState createState() => _MyRidePageState();
}

class _MyRidePageState extends State<MyRidePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 13));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(33, 114, 243, 1),
      ),
      body: Center(
        child:
            Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Text("Fe Tare2k",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20,color: Colors.blueGrey),),
        Container(
          width: 250,
        child:(
            Image.asset("assets/carpool.png")
        )
        ),
                  SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      _editProfile(),
                        SizedBox(width: 20,),
                       _pastRides(),
                        SizedBox(width: 20,),
                       _dashBoard(),
                    ],
                  ),
        ]      )
      ),
      );
  }
}

Widget _editProfile() {
  return Column(
    children: [
      Icon(Icons.car_rental,
            color: Color.fromRGBO(33, 114, 243, 1),
        size: 60,),
      Text("Ride"),
    ],
  );
}

Widget _pastRides() {
  return Column(
    children: [
    Icon(Icons.drive_eta_rounded,
          color: Color.fromRGBO(33, 114, 243, 1),
        size: 60,),
      Text("Drive")
    ],
  );
}

Widget _dashBoard() {
  return Column(
    children: [
     Icon(Icons.attach_money,
            color: Color.fromRGBO(33, 114, 243, 1),
        size: 60,),
      Text("Save")
    ],
  );
}