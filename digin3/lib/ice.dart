import 'package:flutter/material.dart';
import 'checkout.dart';

class Ice extends StatefulWidget{
  IceState createState() => IceState();
}

class IceState extends State<Ice> {

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
          child: Image.asset('ice.jpg', fit: BoxFit.cover)
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text('Ice Cream', style: TextStyle(fontSize: 40.0))
                    ),
                  ],
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     FlatButton(
                          child: Text('ADD',style: TextStyle(fontSize: 20), ),
                          onPressed:() => checkout.add('Ice cream'),),
                   ],
                 ),
                ListTile(
                  title: Text('Quantity: 7')
                ),
                ListTile(
                  title: Text('Available at: London, UK')
                ),
                ListTile(
                  title: Text('Description:\n\nLovely homemade ice cream, made with local ingredients.')
                ),
                ListTile(
                  title: Text('\n\nPrice: €2,20', style: TextStyle(fontSize: 40),)
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