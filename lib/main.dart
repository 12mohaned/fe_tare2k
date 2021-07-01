import 'package:fe_tare2k/views/authentication/Login.dart';
import 'package:fe_tare2k/views/authentication/Signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Ride Hail"),
          backgroundColor: Color.fromRGBO(33, 114, 243, 1),

        ),
        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Register('Register'),
                SizedBox(height: 28.0, width: 15.0),
                Login('Login'),
              ],
            )
        ),
      ),
    );
  }
}

class Register extends StatelessWidget {
  final String persona;
  const Register(this.persona);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(0.7),
          child: ElevatedButton(
            child: Text(persona,
                style: TextStyle(
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MySignupForm()),
              );
            },
          ),
        ));
  }
}

class Login extends StatelessWidget {
  final String persona;
  const Login(this.persona);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(0.7),
          child: ElevatedButton(
            child: Text(persona,
                style: TextStyle(
                )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyLoginForm()),
              );
            },
          ),
        ));
  }
}