import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wheels/add/add.dart';
import 'package:wheels/groups/groups.dart';
import 'package:wheels/home/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wheels/savedTrips/savedTrips.dart';
import 'package:wheels/sharedPreferences/preferences.dart';
import 'package:wheels/uploadedTrips/uploadedtrips.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedTrips(),
                ),
              );
            },
            icon: Icon(Icons.account_tree_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadedTrips(),
                ),
              );
            },
            icon: Icon(Icons.analytics_outlined),
          ),
        ],
        title: Text(
          "Wheels Uniandes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: buildPostCard(context),

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

Widget noPost() {
  return Text("");
}

Widget buildPostCard(context) {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            upperCardRow(
              image: "https://edouardfouche.com/img/color-wheel/farbkreis.png",
              title: "Grupo",
              subtitle: "Grupo",
              time: "Hora",
              day: "Dia",
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
                      text: "Ruta",
                      originUniandes: true,
                    ),
                    lowerColumnText(
                      context,
                      "Nombre",
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
                      text: "Lugar1",
                    ),
                    columnChildContainer(
                      context,
                      text: "Lugar2",
                      marginTop: 3,
                    ),
                    columnChildContainer(
                      context,
                      text: "Lugar3",
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
                      text: "Ruta",
                      originUniandes: true,
                    ),
                    lowerColumnText(
                      context,
                      "\$ Precio",
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
      var url = "https://api.whatsapp.com/send?phone=57" +
          "Numero Whatsapp" +
          "&text=Hola%2C%20he%20visto%20tu%20anuncio%20en%20la%20app%20de%20wheels%20uniandes%20!";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    },
  );
}
