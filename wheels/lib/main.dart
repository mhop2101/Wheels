import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
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
      appBar: AppBar(
        title: Text("Test"), 
        centerTitle: true,
        actions: [Container(child: IconButton(icon:Icon(Icons.share), onPressed: ()=>0,),margin: EdgeInsets.only(right: 20),),],
      ),
      body: Container(child: Center(child: Text("Container"),),decoration: BoxDecoration(color:Colors.yellow),
    ));
  }
}




