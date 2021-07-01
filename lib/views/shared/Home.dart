import 'package:flutter/material.dart';

import '../MyRidePage.dart';
import '../Profile.dart';
import '../find-ride.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HomeWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _MyHomeWidgettState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyHomeWidgettState extends State<HomeWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MyRidePage(title : "Home"),
    ProfilePage(title: "Profile"),
    FindRide(title: "find a ride"),
    FindRide(title: "Publish a ride")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor : Color.fromRGBO(33, 114, 243, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor : Color.fromRGBO(33, 114, 243, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.departure_board),
            label: 'Ride',
            backgroundColor : Color.fromRGBO(33, 114, 243, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta),
            label: 'Publish a ride',
            backgroundColor : Color.fromRGBO(33, 114, 243, 1),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

