import 'package:date_field/date_field.dart';
import 'package:fe_tare2k/Model/City.dart';
import 'package:fe_tare2k/net/API_callers/city_API_caller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'RequestRide_Widget.dart';

late String _pickup;
late String _destination;
late int _passengers;
late DateTime _date;

class FindRide extends StatefulWidget {
  FindRide({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FindRideState createState() => _FindRideState();
}

Widget _buildDate(){
  final DateTime now = DateTime.now();

  return Center(
    child:(
        DateTimeFormField(
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.black45),
            errorStyle: TextStyle(color: Colors.redAccent),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.event_note),
            labelText: 'Date and time',
          ),
          mode: DateTimeFieldPickerMode.dateAndTime,
          autovalidateMode: AutovalidateMode.always,
          validator: (value){

          } ,
          onDateSelected: (DateTime value) {
            _date = value;
          },
        )),
  );
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
        child: Column(children: [
          RideForm(),
          SizedBox(
            width: 2,
            height: 20,
          ),
          SizedBox(
            width: 100,
            height: 30,
            child: ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RequestRidePage(title: "Available Rides")),
                );
              },
              child: const Text('Search'),
            ),
          ),
        ]),
      ),
    );
  }
}

// The form responsible for reserving a ride
class RideForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RideFormState();
  }
}

class RideFormState extends State<RideForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: _formKey,
        child:(
      Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(6, 70, 10, 10),
              child: SizedBox(
                width: 160,
                height: 50,
                child: TypeAheadFormField<City?>(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: this._pickupController,
                      decoration: InputDecoration(
                          labelText: 'Pickup'
                      )
                  ),
                  suggestionsCallback: CityCaller.getCitiesInfo,
                  itemBuilder: (context, City? suggestion){
                    final city =suggestion;
                    return ListTile(
                      title: Text(city!.name),
                    );
                  },
                  noItemsFoundBuilder: (context) =>
                      Container(
                          height: 20,
                          child: Text(
                              "No cities found"
                          )),
                  onSuggestionSelected: (suggestion) {
                    this._pickupController.text = suggestion!.name;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a pickup';
                    }
                  },
                  onSaved: (value) => _pickup = value!,
                ),
              ),
            ),
            SizedBox(
              width: 10,
              height: 20,
            ),
            SizedBox(
              width: 160,
              height: 90,
              child: _buildDate(),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(12, 70, 10, 10),
              child: SizedBox(
                width: 160,
                height: 50,
                child: TypeAheadFormField<City?>(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: this._destinationController,
                      decoration: InputDecoration(
                          labelText: 'Destination'
                      )
                  ),
                  suggestionsCallback: CityCaller.getCitiesInfo,
                  itemBuilder: (context, City? suggestion){
                    final city =suggestion;
                    return ListTile(
                      title: Text(city!.name),
                    );
                  },
                  noItemsFoundBuilder: (context) =>
                      Container(
                          height: 20,
                          child: Text(
                              "No cities found"
                          )),
                  onSuggestionSelected: (suggestion) {
                    this._destinationController.text = suggestion!.name;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a destination';
                    }
                  },
                  onSaved: (value) => _destination = value!,

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
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: 'Passengers',
                    contentPadding:
                        new EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    )
      ));
  }
}
