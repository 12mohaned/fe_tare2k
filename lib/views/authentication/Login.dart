import 'package:fe_tare2k/views/shared/Home.dart';
import 'package:flutter/material.dart';



class MyLoginForm extends StatefulWidget {
  @override
  LoginForm createState() {
    return LoginForm();
  }
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
      )
  );
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
        body: (Form(
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
                    child: const Text('Submit'),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeApp()),
                          );
                      }
                    },
                  )),
            ],
          ),
        )));
  }
}