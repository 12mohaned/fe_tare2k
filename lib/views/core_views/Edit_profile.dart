import 'package:fe_tare2k/net/API_callers/trips_API_caller.dart';
import 'package:fe_tare2k/net/API_callers/user_API_caller.dart';
import 'package:flutter/material.dart';
import 'package:fe_tare2k/globals.dart' as globals;

late String _firstName;
late String _lastName;
late String _email;
late int _phoneNumber;

final GlobalKey<FormState> _EditProfileFormKey = GlobalKey<FormState>();

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyEditProfilePageState createState() => _MyEditProfilePageState();
}

Widget _buildFirstName() {
  return Container(
      width: 150,
      child: (TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Fill First Name';
          }
          return null;
        },
        onSaved: (value) {
          _firstName = value.toString();
        },
        initialValue: globals.firstname,
        decoration: new InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'First Name',
        ),
      )));
}

Widget _buildLastName() {
  return Container(
      width: 150,
      child: (TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Fill Last Name';
          }
          return null;
        },
        initialValue: globals.lastname,
        onSaved: (value) {
          _lastName = value.toString();
        },
        decoration: new InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Last Name',
        ),
      )));
}

Widget _buildPhoneNumber() {
  return Container(
      width: 150,
      child: (TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Fill Phone Number';
          }
          return null;
        },
        onSaved: (value) {
          _phoneNumber = int.parse(value.toString());
        },
        initialValue: globals.phoneNumber.toString(),
        decoration: new InputDecoration(
          icon: Icon(Icons.smartphone),
          labelText: 'Phone number',
        ),
        keyboardType: TextInputType.number,
      )));
}

Widget _buildEmail() {
  return Container(
      width: 280,
      child: (TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Fill Email';
          }
          return null;
        },
        initialValue: globals.email,
        onSaved: (value) {
          _email = value.toString();
        },
        decoration: new InputDecoration(
          hintText: 'Email',
          icon: Icon(Icons.mail),
          labelText: 'Email',
        ),
      )));
}

class _MyEditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: Color.fromRGBO(33, 114, 243, 1),
        ),
        body: SingleChildScrollView(
        child:(Form(
            key: _EditProfileFormKey,
            child:(Column(children: [
          _buildFirstName(),
          _buildLastName(),
          Center(
            child:(
          _buildEmail()
          )),
          _buildPhoneNumber(),
              Container(
                  child: new ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () async {
                      if (_EditProfileFormKey.currentState!.validate()) {
                        _EditProfileFormKey.currentState!.save();
                          UserCaller.updateProfile(_firstName, _lastName, _email, _phoneNumber);
                      }
                    },
                  ))
        ],)
    )))));
  }
}

// TO DO : Future improvement
// //This function should detect any updates in the personal information
// bool IsProfilechanged(){
//  return (_firstName == globals.firstname) & (_lastName == globals.lastname) &
//  (_phoneNumber.toString() == globals.phoneNumber) & (_email == globals.email);
// }