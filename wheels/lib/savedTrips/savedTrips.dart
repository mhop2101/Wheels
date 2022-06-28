import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wheels/sharedPreferences/preferences.dart';

class SavedTrips extends StatefulWidget {
  SavedTrips({Key? key}) : super(key: key);

  @override
  _SavedTripsState createState() => _SavedTripsState();
}

class _SavedTripsState extends State<SavedTrips> {
  final _preferenceService = PreferencesService();
  var storedTrips = [];
  var stringTripsList = [];

  @override
  void initState() {
    super.initState();
    _preferenceService.getTripInfo().then((dynamic snapshot) {
      if (snapshot != null) {
        for (var i = 0; i < snapshot.length; i += 1) {
          var storedTripMap = json.decode(snapshot[i]);
          storedTrips.add(storedTripMap);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rutas guardadas"),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              var storedTrips = [];
              dynamic stringTrips = snapshot.data;
              for (var i = 0; i < stringTrips.length; i += 1) {
                storedTrips.add(json.decode(stringTrips[i]));
                stringTripsList.add(stringTrips[i]);
              }
            } else {
              return CircularProgressIndicator.adaptive();
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nombre : ${storedTrips[index]["Nombre"]}"),
                            Text("Tarifa : ${storedTrips[index]["Precio"]}"),
                            Text(
                                "Ruta   : ${storedTrips[index]["destinationOrigin"]}"),
                            Text("Lugar 1: ${storedTrips[index]["Lugar1"]}"),
                            Text("Lugar 2: ${storedTrips[index]["Lugar2"]}"),
                            Text("Lugar 3: ${storedTrips[index]["Lugar3"]}"),
                            Text("Grupo  : ${storedTrips[index]["Grupo"]}"),
                            Text(
                                "Numero : ${storedTrips[index]["Numero Whatsapp"]}"),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _preferenceService
                                    .deleteTrip(stringTripsList[index]);
                                storedTrips.remove(storedTrips[index]);
                              });
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  );
                },
                itemCount: storedTrips.length);
          },
          future: _preferenceService.getTripInfo(),
        ));
  }
}

/*
ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 5,
            thickness: 5,
            color: Colors.black,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Text(storedTrips[index].toString());
        },
        itemCount: storedTrips.length,
      ),
 */
