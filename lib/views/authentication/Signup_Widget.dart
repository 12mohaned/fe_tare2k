import 'package:flutter/material.dart';
import 'package:fe_tare2k/views/core_views/Home_Widget.dart';
import 'package:fe_tare2k/FirebaseAuthentication/auth.dart';
import 'package:firebase_core/firebase_core.dart';

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final AuthService _auth = AuthService();
late String _firstName;
late String _lastName;
late String _password;
late String _email;
late int _phoneNumber;

class SignupOptionWidget extends StatefulWidget {
  const SignupOptionWidget({Key? key}) : super(key: key);

  @override
  State<SignupOptionWidget> createState() => _SignUpOptionState();
}

class _SignUpOptionState extends State<SignupOptionWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    SignupWithEmail(),
    SignupWithPhone(),
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
            icon: Icon(Icons.email),
            label: 'Signup with email',
            backgroundColor: Color.fromRGBO(33, 114, 243, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smartphone),
            label: 'Sign up with phone',
            backgroundColor: Color.fromRGBO(33, 114, 243, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MySignupForm extends StatefulWidget {
  @override
  SignupForm createState() {
    return SignupForm();
  }
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
      width: 250,
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
        decoration: new InputDecoration(
          icon: Icon(Icons.smartphone),
          labelText: 'Phone number',
        ),
        keyboardType: TextInputType.number,
      )));
}

Widget _buildEmail() {
  return Container(
      width: 300,
      child: (TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Fill Email';
          }
          return null;
        },
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

Widget _buildPassword() {
  return Container(
    width: 300,
    child: (TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Fill Password';
        }
        return null;
      },
      onSaved: (value) {
        _password = value.toString();
      },
      obscureText: true,
      decoration: new InputDecoration(
        hintText: 'Password',
        icon: Icon(Icons.vpn_key),
        labelText: 'Password',
      ),
    )),
  );
}

class SignupWithPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: (Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                _buildFirstName(),
                SizedBox(width: 30),
                _buildLastName(),
              ],
            ),
            _buildPhoneNumber(),
            _buildPassword(),
            SizedBox(height: 10.0, width: 12.0),
            new Container(
                child: new ElevatedButton(
              child: const Text('Sign up'),
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  dynamic result = await _auth.signup(
                      _firstName, _lastName, _email, _phoneNumber, _password);
                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeApp()),
                    );
                  }
                }
              },
            )),
          ],
        ),
      )),
    );
  }
}

class SignupWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: (Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                _buildFirstName(),
                SizedBox(width: 30),
                _buildLastName(),
              ],
            ),
            _buildEmail(),
            _buildPassword(),
            SizedBox(height: 10.0, width: 12.0),
            new Container(
                child: new ElevatedButton(
              child: const Text('Sign up'),
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                  dynamic result = await _auth.signup(
                      _firstName, _lastName, _email, _phoneNumber, _password);
                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeApp()),
                    );
                  }
                }
              },
            )),
          ],
        ),
      )),
    );
  }
}

class SignupForm extends State<MySignupForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup"),
        backgroundColor: Color.fromRGBO(33, 114, 243, 1),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text("Error");
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return SignupOptionWidget();
          }
          return Center(child: (CircularProgressIndicator()));
        },
      ),
    );
  }
}
