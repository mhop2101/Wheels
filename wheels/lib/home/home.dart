import 'package:flutter/material.dart';
import 'package:wheels/add/add.dart';
import 'package:wheels/groups/groups.dart';
import 'package:wheels/home/styles.dart';
import '../models/postModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TripPost> trips = TripPost.getAllTrips();

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
              })
        ],
        title: Text(
          "Wheels Uniandes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (BuildContext context, int index) => buildPostCard(
          context,
          index,
          trips,
        ),
      ),
    );
  }
}

Widget buildPostCard(context, index, trips) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Color(trips[index].color),
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
            image: trips[index].image,
            title: trips[index].groupTitle,
            subtitle: trips[index].groupSubtitle,
            time: trips[index].time,
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
                  columnChildContainer(
                    context,
                    text: trips[index].origin,
                  ),
                  lowerColumnText(
                    text: trips[index].name,
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
                    text: trips[index].place1,
                  ),
                  columnChildContainer(
                    context,
                    text: trips[index].place1,
                    marginTop: 3,
                  ),
                  columnChildContainer(
                    context,
                    text: trips[index].place1,
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
                  columnChildContainer(
                    context,
                    text: trips[index].destination,
                  ),
                  lowerColumnText(
                    text: "\$ ${trips[index].price.toString()}",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
