import 'package:flutter/material.dart';
import 'checkout.dart';

class Lasagna extends StatefulWidget{
  LasagnaState createState() => LasagnaState();
}

class LasagnaState extends State<Lasagna> {

  List checkout = [];

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
                          onPressed:() => checkout.add('lasagna'),),
                   ],
                 ),
                ListTile(
                  title: Text('Quantity: 5')
                ),
                ListTile(
                  title: Text('Available at: Manchester, UK')
                ),
                ListTile(
                  title: Text('Description:\n\nA lovely homemade lasagna, made with local ingredients.')
                ),
                ListTile(
                  title: Text('\n\nPrice: €5', style: TextStyle(fontSize: 40),)
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