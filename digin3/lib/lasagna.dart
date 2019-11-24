import 'package:flutter/material.dart';

class Lasagna extends StatefulWidget{
  LasagnaState createState() => LasagnaState();
}

class LasagnaState extends State<Lasagna> {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_basket),
        backgroundColor: Color(0xff7d9b09),
        onPressed: () => Navigator.pushReplacementNamed(context, '/checkout'),
      ),
      body: Column( 
        children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height/3,
          child: Image.asset('Lasagna.jfif', fit: BoxFit.cover)
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text('Lasagna', style: TextStyle(fontSize: 40.0))
                    ),
                  ],
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     FlatButton(
                          child: Text('ADD',style: TextStyle(fontSize: 20), ),
                          onPressed:() {},),
                   ],
                 ),
                ListTile(
                  title: Text('This is homemade lasagna')
                )
              ],
            ),
          ),

        ),
        ],
      )
    );

  }
}