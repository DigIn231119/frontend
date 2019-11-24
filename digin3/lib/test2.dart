import 'package:flutter/material.dart';

class Test2 extends StatefulWidget{
  Test2State createState() => Test2State();
}

class Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('This is a tile')
          ),
          Form(
            child: TextFormField(decoration: InputDecoration(labelText: 'this is a label'),),
          ),
          Column(children: <Widget>[
            Container(color: Colors.red,)
          ],)
        ],
      )
    );
  }
}