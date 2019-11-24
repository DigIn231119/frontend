import 'package:flutter/material.dart';
import 'checkout.dart';

class Sushi extends StatefulWidget{
  SushiState createState() => SushiState();
}

class SushiState extends State<Sushi> {

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
          child: Image.asset('sushi.jpg', fit: BoxFit.cover)
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text('Sushi', style: TextStyle(fontSize: 40.0))
                    ),
                  ],
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     FlatButton(
                          child: Text('ADD',style: TextStyle(fontSize: 20), ),
                          onPressed:() => checkout.add('Sushi'),),
                   ],
                 ),
                ListTile(
                  title: Text('Quantity: 3')
                ),
                ListTile(
                  title: Text('Available at: Dublin, Ireland')
                ),
                ListTile(
                  title: Text('Description:\n\nLovely homemade sushi, made with local ingredients.')
                ),
                ListTile(
                  title: Text('\n\nPrice: €7,30', style: TextStyle(fontSize: 40),)
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