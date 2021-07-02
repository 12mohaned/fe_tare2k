import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 13));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(33, 114, 243, 1),
      ),
      body: Center(child:
        UserinformationWidget(),
      )
    );
  }
}

Widget _FirstName() {
  return Text("Mohaned",
      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18.0));
}
Widget _LastName() {
  return Text("Mashaly",
      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18.0));
}
Widget _Email() {
  return Text("Mohaned.mashaly12@gmail.com",
      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18.0));
}
Widget _Phone() {
  return Text("01064042430",
      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18.0));
}

Widget _EditProfile(){

  return
    Column( children:[
    IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
      },
  ),
      Text("Edit profile")
  ],
  );
}

Widget _PastRides(){
  return
    Column( children:[
      IconButton(
        icon: const Icon(Icons.drive_eta_rounded),
        onPressed: () {
        },
      ),
      Text("Past rides")
    ],
    );
}

Widget _Dashboard(){
  return
    Column( children:[
      IconButton(
        icon: const Icon(Icons.dashboard),
        onPressed: () {
        },
      ),
      Text("Dashboard")
    ],
    );
}

class UserinformationWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Stack(
          children: [
            Positioned(top:140, left: 140, child: _FirstName()),
            Positioned(top:180, left: 140, child: _LastName()),
            Positioned(top:220, right: 50, child: _Email()),
            Positioned(top:260, left: 120, child: _Phone()),
            Positioned(top:380, left: 40,child:_EditProfile()),
            Positioned(top:380, left: 140,child:_PastRides()),
            Positioned(top:380, left: 250,child:_Dashboard()),
          ],
        ),
      );
  }
}
