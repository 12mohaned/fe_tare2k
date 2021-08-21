import 'package:fe_tare2k/Model/Profile.dart';
import 'package:fe_tare2k/net/API_callers/trips_API_caller.dart';
import 'package:fe_tare2k/net/API_callers/user_API_caller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'PastRides.dart';

late Future<Profile> profileInformation;

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<Profile> _getUserInfo() async {
    var _userData = await UserCaller.getProfile();
    return _userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: Color.fromRGBO(33, 114, 243, 1),
        ),
        body: Center(
          child: FutureBuilder<Profile>(
            builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
              print(snapshot.toString().length);
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Positioned(
                        top: 140,
                        left: 140,
                        child: _firstName(snapshot.data!.firstName)),
                    Positioned(
                        top: 180,
                        left: 140,
                        child: _lastName(snapshot.data!.lastName)),
                    Positioned(
                        top: 220,
                        right: 50,
                        child: _email(snapshot.data!.email)),
                    Positioned(
                        top: 260,
                        left: 120,
                        child: _phone(snapshot.data!.phoneNumber.toString())),
                    Positioned(top: 380, left: 40, child: _editProfile()),
                    Positioned(top: 380, left: 140, child: _pastRides(context)),
                    Positioned(top: 380, left: 250, child: _dashBoard()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
            future: _getUserInfo(),
          ),
        ));
  }
}

Widget _firstName(firstName) {
  return Text(firstName,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0));
}

Widget _lastName(lastName) {
  return Text(lastName,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0));
}

Widget _email(email) {
  return Text(email,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0));
}

Widget _phone(phone) {
  return Text(phone,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0));
}

Widget _editProfile() {
  return Column(
    children: [
      IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {},
      ),
      Text("Edit profile")
    ],
  );
}

Widget _pastRides(context) {
  return Column(
    children: [
      IconButton(
        icon: const Icon(Icons.drive_eta_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PastRidesPage(
                title: 'past rides',
              ),
            ),
          );
        },
      ),
      Text("Past rides")
    ],
  );
}

Widget _dashBoard() {
  return Column(
    children: [
      IconButton(
        icon: const Icon(Icons.dashboard),
        onPressed: () {},
      ),
      Text("Dashboard")
    ],
  );
}
