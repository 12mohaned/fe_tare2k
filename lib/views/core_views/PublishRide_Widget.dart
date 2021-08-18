import 'package:fe_tare2k/Model/City.dart';
import 'package:fe_tare2k/net/API_callers/city_API_caller.dart';
import 'package:fe_tare2k/net/API_callers/trips_API_caller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:date_field/date_field.dart';

late String _pickup;
late String _destination;
late int _passengers;
late double _price;
late DateTime _date;

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  TripCaller.publishRide(_pickup, _destination, _date, _passengers,
                  _price);
                }
              },
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

Widget _buildPassenger() {
  return Container(
    width: 300,
    child: (TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Fill Passengers";
        }
      },
      onSaved: (value) {
        print(_passengers);
        _passengers = value! as int;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Passenger",
          contentPadding:
              new EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
      keyboardType: TextInputType.number,
    )),
  );
}

Widget _buildPrice() {
  return Container(
    width: 300,
    child: (TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Fill Price";
        }
      },
      onSaved: (value) {
        _price = value! as double;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Price",
          contentPadding:
              new EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    )),
  );
}

Widget _buildDate() {
  final DateTime now = DateTime.now();

  return Center(
    child: (DateTimeFormField(
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.event_note),
        labelText: 'Date and time',
      ),
      mode: DateTimeFieldPickerMode.dateAndTime,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        var now = new DateTime.now();
        if (value == null) {
          return "Fill date";
        }
        if (value.isBefore(now)) {
          return "Choose correct date";
        }
      },
      onDateSelected: (DateTime value) {
        _date = value;
      },
    )),
  );
}

Widget _buildPickup() {
  TextEditingController _pickupController = TextEditingController();
  return Container(
    child: TypeAheadFormField<City?>(
      textFieldConfiguration: TextFieldConfiguration(
          controller: _pickupController,
          decoration: InputDecoration(labelText: 'Pickup')),
      suggestionsCallback: CityCaller.getCitiesInfo,
      itemBuilder: (context, City? suggestion) {
        final city = suggestion;
        return ListTile(
          title: Text(city!.name),
        );
      },
      noItemsFoundBuilder: (context) =>
          Container(height: 20, child: Text("No cities found")),
      onSuggestionSelected: (suggestion) {
        _pickupController.text = suggestion!.name;
        _pickup = _pickupController.text;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select a pickup';
        }
      },
    ),
  );
}

Widget _buildDestination(){
  TextEditingController _destinationController = TextEditingController();

  return Container(child:
  TypeAheadFormField<City?>(
    textFieldConfiguration: TextFieldConfiguration(
        controller: _destinationController,
        decoration:
        InputDecoration(labelText: 'Destination')),
    suggestionsCallback: CityCaller.getCitiesInfo,
    itemBuilder: (context, City? suggestion) {
      final city = suggestion;
      return ListTile(
        title: Text(city!.name),
      );
    },
    noItemsFoundBuilder: (context) =>
        Container(height: 20, child: Text("No cities found")),
    onSuggestionSelected: (suggestion) {
      _destinationController.text = suggestion!.name;
      _destination = _destinationController.text;
    },
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please select a destination';
      }
    },
  ),
  );
}

class AddRideFormState extends State<AddRideForm> {
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
                SizedBox(width: 25,),
                Container(
                width: 120,
                  child :(
                _buildPickup()
                  )
                ),
                SizedBox(width: 50,),
                Container(
                    width: 145,
                    child :(
                        _buildDestination()
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:135,
                  child: _buildDate(),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 110,
                  height: 50,
                  child: _buildPrice(),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}


