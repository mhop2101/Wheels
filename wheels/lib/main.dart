import 'package:flutter/material.dart';
import 'package:wheels/styles.dart';

import 'styles.dart';

void main() {
  runApp(
    new MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.13,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Wheels \nUniandes", style: loginUniandesStyle),
            Text("Fácil", style: lowerLoginCaption),
            Text("Rápido", style: lowerLoginCaption),
            Text("Barato", style: lowerLoginCaption),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.13,
                top: MediaQuery.of(context).size.height * 0.13,
                bottom: MediaQuery.of(context).size.height * 0.1,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // login logic to be implemented
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_right, size: 34, color: Color(0xffb21b31)),
                    Text(
                      "Iniciar Sesión",
                      style: TextStyle(color: Color(0xffb21b31), fontSize: 17),
                    ),
                  ],
                ),
                style: loginButtonStyle,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffb21b31),
    );
  }
}

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
        leading: IconButton(icon: Icon(Icons.apps), onPressed: () {}),
        actions: [
          IconButton(icon: Icon(Icons.add, size: 35), onPressed: () {})
        ],
        title: Text(
          "Wheels Uniandes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
