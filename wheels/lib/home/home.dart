import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wheels/Profile/profileOther.dart';
import 'package:wheels/add/add.dart';
import 'package:wheels/Profile/profile.dart';

import 'package:wheels/groups/groups.dart';
import 'package:wheels/home/styles.dart';
import "dart:math";
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tripsRef = FirebaseDatabase.instance.reference().child("Viajes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Groups(),
                ),
              );
            }),
        actions: [
          IconButton(
              icon: Icon(Icons.add, size: 35),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Add(),
                  ),
                );
              }),
          IconButton(
              icon: Icon(Icons.person, size: 35),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              })
        ],
        title: Text(
          "Wheels Uniandes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FirebaseAnimatedList(
        query: _tripsRef,
        itemBuilder: (
          BuildContext context,
          DataSnapshot snapshot,
          Animation<double> animation,
          int index,
        ) {
          return buildPostCard(context, index, snapshot);
        },
      ),
      /*
      ListView.builder(
        itemCount: trips.length,
        itemBuilder: (BuildContext context, int index) => buildPostCard(
          context,
          index,
          trips,
        ),
      ),*/
    );
  }
}

Widget buildPostCard(context, index, trips) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          //color: [
          //Color(0xffB21B31),
          //Color(0xffE59503),
          //Color(0xffD561D5),
          //Color(0xff4B0082)
          //][Random().nextInt(3)],
          color: Color(0xffB21B31),

          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 5.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            upperCardRow(
              image:
                  "https://i.dlpng.com/static/png/5277114-user-staff-person-man-profile-boss-circle-svg-png-icon-free-person-icon-png-980_980_preview.png",
              title: trips.value["Grupo"].split(" ")[0],
              subtitle: trips.value["Grupo"].split(" ")[0],
              time: trips.value["Hora"],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // From column
                Column(
                  children: [
                    columnTitleContainer(
                      context,
                      "Desde",
                    ),
                    columnChildContainerOri(
                      context,
                      text: trips.value["Ruta"],
                      originUniandes: trips.value["OrigenUniandes"],
                    ),
                    lowerColumnText(
                      context,
                      trips.value["Nombre"],
                    ),
                  ],
                ),
                // Trip column
                Column(
                  children: [
                    columnTitleContainer(
                      context,
                      "Ruta",
                    ),
                    columnChildContainer(
                      context,
                      text: trips.value["Lugar1"],
                    ),
                    columnChildContainer(
                      context,
                      text: trips.value["Lugar2"],
                      marginTop: 3,
                    ),
                    columnChildContainer(
                      context,
                      text: trips.value["Lugar3"],
                      marginTop: 3,
                    ),
                  ],
                ),
                // To column
                Column(
                  children: [
                    columnTitleContainer(
                      context,
                      "Hacia",
                    ),
                    columnChildContainerDest(
                      context,
                      text: trips.value["Ruta"],
                      originUniandes: trips.value["OrigenUniandes"],
                    ),
                    lowerColumnText(
                      context,
                      "\$ ${trips.value["Precio"]}",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    onTap: () async {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfileOther()),
      );
    },
  );
}
