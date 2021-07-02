import 'package:flutter/material.dart';

class AddRide extends StatefulWidget {
  AddRide({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddRideState createState() => _AddRideState();
}

class _AddRideState extends State<AddRide> {
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
        child: Column(children: [
          AddRideForm(),
          SizedBox(
            width: 1,
            height: 18,
          ),
          SizedBox(
            width: 100,
            height: 30,
            child: ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Text('Publish'),
            ),
          ),
        ]),
      ),
    );
  }
}

// The form responsible for reserving a ride
class AddRideForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddRideFormState();
  }
}

class AddRideWidget extends StatelessWidget {
  final String hintText;
  const AddRideWidget({Key? key, required this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: this.hintText,
          contentPadding:
              new EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
    );
  }
}

class AddRideFormState extends State<AddRideForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(5, 1, 1, 20),
              child: SizedBox(
                  width: 160,
                  height: 50,
                  child: AddRideWidget(hintText: ' Pick-up')),
            ),
            SizedBox(
              width: 10,
              height: 2,
            ),
            SizedBox(
                width: 160, height: 50, child: AddRideWidget(hintText: 'Date')),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(6, 40, 10, 10),
              child: SizedBox(
                  width: 160,
                  height: 50,
                  child: AddRideWidget(hintText: 'Drop-off')),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            SizedBox(
              width: 160,
              height: 50,
              child: AddRideWidget(hintText: 'Passengers'),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            SizedBox(
              width: 160,
              height: 45,
              child: AddRideWidget(hintText: 'Luggage'),
            )
          ],
        ),
      ],
    );
  }
}
