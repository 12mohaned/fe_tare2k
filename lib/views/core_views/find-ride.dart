import 'package:flutter/material.dart';

class FindRide extends StatefulWidget {
  FindRide({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FindRideState createState() => _FindRideState();
}

class _FindRideState extends State<FindRide> {
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
        child: Column(children:[RideForm(),
          SizedBox(
            width: 2,
            height: 20,
          ),
          SizedBox(
            width: 100,
            height: 30,
            child:
            ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Text('Search'),

            ),
          ),]),
      ),
    );
  }
}
// The form responsible for reserving a ride
class RideForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RideFormState();
  }
}

class RideFormState extends State<RideForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      Row(children:<Widget>[
        Column(children:<Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(6,70,10,10),
            child: SizedBox(
              width: 160,
              height: 50,
              child:
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Pick-up',
                    contentPadding: new EdgeInsets.symmetric(horizontal : 30,vertical: 5)
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
            height: 20,
          ),
          SizedBox(
            width: 160,
            height: 50,
            child:
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Date',
                  contentPadding: new EdgeInsets.symmetric(horizontal : 30,vertical: 5)
              ),
            ),
          ),

        ],
        ),
        Column(children:<Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(12,70,10,10),
            child: SizedBox(
              width: 160,
              height: 50,
              child:
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Drop-off',
                    contentPadding: new EdgeInsets.symmetric(horizontal : 30,vertical: 5)
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
            height: 20,
          ),
          SizedBox(
            width: 160,
            height: 50,
            child:
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Passengers',
                  contentPadding: new EdgeInsets.symmetric(horizontal : 30,vertical: 5)
              ),
            ),
          ),

        ],
        ),

      ],

      );
  }
}