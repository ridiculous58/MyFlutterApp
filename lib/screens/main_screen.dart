
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
  
}

class MainScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yardıma Ihtiyacim Var"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
  
}