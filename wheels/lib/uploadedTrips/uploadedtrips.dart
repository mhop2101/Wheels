import 'package:flutter/material.dart';

class UploadedTrips extends StatefulWidget {
  UploadedTrips({Key? key}) : super(key: key);

  @override
  _UploadedTripsState createState() => _UploadedTripsState();
}

class _UploadedTripsState extends State<UploadedTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rutas publicadas"),
        backgroundColor: Colors.black,
      ),
    );
  }
}
