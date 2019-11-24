import 'package:flutter/material.dart';

class Dish extends StatefulWidget{
  DishState createState() => DishState();
}

class DishState extends State<Dish> {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_basket),
        backgroundColor: Color(0xff7d9b09),
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
                ListTile(
                  title: Text('Lasagna', style: TextStyle(fontSize: 40.0))
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