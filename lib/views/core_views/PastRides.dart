import 'package:fe_tare2k/net/API_callers/trips_API_caller.dart';
import 'package:flutter/material.dart';

class PastRidesPage extends StatefulWidget {
  PastRidesPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyPastRidesPageState createState() => _MyPastRidesPageState();
}

class _MyPastRidesPageState extends State<PastRidesPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List> _getPastRidesInfo() async {
    var _pastTrips = await TripCaller.getPastTrips();
    return _pastTrips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: Color.fromRGBO(33, 114, 243, 1),
        ),
        body: Center(
          child: (FutureBuilder<List>(
            future: _getPastRidesInfo(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                List? data = snapshot.data;
                return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  data[index]['price'].toString() + "\$",
                                  style: TextStyle(color: Colors.black87),
                                )
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(data[index]['pickup']),
                                Icon(Icons.arrow_right_alt_outlined),
                                Text(data[index]['destination'])
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Departure time: " +
                                    data[index]['time'].toString()),
                              ],
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text(data[index]['date']),
                              trailing: TextButton(
                                child: Text('Select'),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ));
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )),
        ));
  }
}
