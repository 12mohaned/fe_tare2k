import 'package:fe_tare2k/views/core_views/Home_Widget.dart';
import 'package:flutter/material.dart';
import 'package:fe_tare2k/FirebaseAuthentication/auth.dart';
import 'package:firebase_core/firebase_core.dart';

class MyLoginForm extends StatefulWidget {
  @override
  LoginForm createState() {
    return LoginForm();
  }
}

late String _email;
late String _password;
final AuthService _auth = AuthService();

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
Widget _buildEmail() {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Email can not be empty';
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
  );
}

Widget _buildPassword() {
  return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password can not be empty';
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
      ));
}

class LoginForm extends State<MyLoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
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
            return Container(
              child: (Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildEmail(),
                    _buildPassword(),
                    SizedBox(height: 10.0, width: 12.0),
                    new Container(
                        child: new ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          dynamic result =
                              await _auth.loginIn(_email, _password);
                          print(result);
                            if (result == authenticationStatus.completed) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeApp()),
                              );
                            }
                          else {}
                        }
                      },
                    )),
                  ],
                ),
              )),
            );
          }
          return Center(child: (CircularProgressIndicator()));
        },
      ),
    );
  }
}
