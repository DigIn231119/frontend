import 'package:flutter/material.dart';
import 'checkout.dart';

class FaC extends StatefulWidget{
  FaCState createState() => FaCState();
}

class FaCState extends State<FaC> {

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
          child: Image.asset('FaC.jpg', fit: BoxFit.cover)
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text('Fish and Chips', style: TextStyle(fontSize: 40.0))
                    ),
                  ],
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     FlatButton(
                          child: Text('ADD',style: TextStyle(fontSize: 20), ),
                          onPressed:() => checkout.add('FishandChips'),),
                   ],
                 ),
                ListTile(
                  title: Text('Quantity: 2')
                ),
                ListTile(
                  title: Text('Available at: Liverpool, UK')
                ),
                ListTile(
                  title: Text('Description:\n\nLovely homemade Fish and Chips, made with local ingredients.')
                ),
                ListTile(
                  title: Text('\n\nPrice: €4,20', style: TextStyle(fontSize: 40),)
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