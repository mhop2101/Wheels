// Trip post list view

import 'package:flutter/material.dart';

Container columnTitleContainer(dynamic context, String text) => Container(
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

Padding columnChildContainer(
  dynamic context, {
  String text = "Dir",
  double marginTop = 8.0,
}) {
  return Padding(
    padding: EdgeInsets.only(top: marginTop),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ),
  );
}

Padding columnChildContainerDest(
  dynamic context, {
  String text = "Dir",
  double marginTop = 8.0,
  bool originUniandes = false,
}) {
  if (originUniandes == false) {
    text = "Uniandes";
  }
  return Padding(
    padding: EdgeInsets.only(top: marginTop),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ),
  );
}

Padding columnChildContainerOri(
  dynamic context, {
  String text = "Dir",
  double marginTop = 8.0,
  bool originUniandes = true,
}) {
  if (originUniandes == true) {
    text = "Uniandes";
  }
  return Padding(
    padding: EdgeInsets.only(top: marginTop),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ),
  );
}

Padding lowerColumnText(
  dynamic context,
  String text,
) =>
    Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 25),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

Row upperCardRow(
        {String title = "Usaquen",
        String subtitle = "Septima",
        String time = "7:00 AM",
        String day = "Nov 23 2020",
        String image =
            "https://edouardfouche.com/img/color-wheel/farbkreis.png"}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, right: 30),
              child: Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Text(
                day,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ],
    );
