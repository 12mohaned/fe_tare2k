import 'package:flutter/material.dart';
import 'package:fe_tare2k/views/core_views/Home.dart';

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class MySignupForm extends StatefulWidget {
  @override
  SignupForm createState() {
    return SignupForm();
  }
}

Widget _buildName() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'Name',
        icon: Icon(Icons.person),
        labelText: 'Name',
      ),
  );
}

Widget _buildEmail() {
  return TextFormField(
      decoration: new InputDecoration(
        hintText: 'Email',
        icon: Icon(Icons.mail),
        labelText: 'Email',
      ),
    );
}

Widget _buildPassword() {
  return TextFormField(
      obscureText: true,
      decoration: new InputDecoration(
        hintText: 'Password',
        icon: Icon(Icons.vpn_key),
        labelText: 'Password',
      ),
   );
}

class SignupForm extends State<MySignupForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Signup"),
          backgroundColor: Color.fromRGBO(33, 114, 243, 1),

        ),
        body: (Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              SizedBox(height: 10.0, width: 12.0),
              new Container(
                  child: new ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeApp()),
                          );

                      } else {}
                    },
                  )),
            ],
          ),
        )));
  }
}