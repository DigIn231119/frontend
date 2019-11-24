import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Customer extends StatefulWidget {
  CustomerState createState() => CustomerState();
}

class CustomerState extends State<Customer> with TickerProviderStateMixin {

  TabController controller;
  int listLength = 0;
  final _formKey = GlobalKey<FormState>();
  

  TextEditingController nameController = TextEditingController();
  TextEditingController cookController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  List tileNames = [];
  List tileCooks = [];
  List tileLocations = [];

  String name = '1';
  String location = '2';
  String cookname = '3';
  String description;
  int quantity;
  String readyTime;

  // @override 
  // bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();

    controller = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_basket),
        backgroundColor: Color(0xff7d9b09),
        onPressed: _showCheckout,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff7d9b09),
      //     bottom: TabBar(
      //     controller: controller,
      //     tabs: <Widget>[
      //       Tab(icon: Icon(Icons.search)),
      //       Tab(icon: Icon(Icons.find_in_page)),
      //     ],
      //   ),
      // ),
      // backgroundColor: Color(0xff7d9b09),
      ),
      body: ListView.builder(
        itemCount: this.listLength,
        itemBuilder: (context, index) => _Tile(name: tileNames[index], cook:tileCooks[index], location: tileLocations[index])
      ),
       drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[ 
                Container(
                height: MediaQuery.of(context).size.height /3,
                color: Color(0xff7d9b09),           
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 20.0),
                  height:100,
                  width: 100,
                  child: Image.asset('logo.png'),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton( //TODO: implement function
                  child: Text('Account', style: TextStyle(color: Colors.black, fontSize: 20),)
                ),
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton( //TODO: implement function
                  child: Text('Settings', style: TextStyle(color: Colors.black, fontSize: 20),)
                ),
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Add Listing', style: TextStyle(color: Colors.black, fontSize: 20),),
                  onPressed: () {
                   showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: 'Dish Name'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter a value';
                            }
                          },
                          onSaved: (input) => name = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: cookController,
                          decoration: InputDecoration(labelText: 'Cook Name'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter a value';
                            }
                          },
                          onSaved: (input) => cookname = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(labelText: 'Location'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter a value';
                            }
                          },
                          onSaved: (input) => location = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Quanity'),
                          validator: (input) {
                            
                            if (input.isEmpty) {
                              return 'Enter a value';
                            }
                          },
                          onSaved: (input) {
                            quantity = int.tryParse(input);
                            if(quantity == null) {
                              return "Enter a number";
                            }
                          },
                          keyboardType: TextInputType.number,
                        ),
                        
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Description'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter a value';
                            }
                          },
                          onSaved: (input) => description = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text('Create'),
                          onPressed: () {
                            // Navigator.pushNamed(context, '/customer');
                            if(_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              _addItem();
                            }
                          }
                        )
                      )
                    ],
                  )
                )
              );
                      }
                    );
                  }
                ),
              ],
            ),
                Row(
              children: <Widget>[
                FlatButton( //TODO: implement function
                  child: Text('Sign Out', style: TextStyle(color: Colors.black, fontSize: 12, ),),
                  onPressed: () => Navigator.pushNamed(context, '/'),
                ),
              ],
            ),              
              ],
        )
      ),
    );
  }

  void _addItem() {
    // TODO validate

    DateTime now = DateTime.now();

    String requestJsonString = jsonEncode({
      'name': name,
      'city': location,
      'description': description,
      'quantity': quantity,
      'readytime': "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:00",
      'cookemail': cookname // TODO change this to logged in user's email later
    });

    // TODO store url in constant
    http.post(
      'https://digin-backend.appspot.com/api/create',
      headers: {'Content-Type': 'application/json'},
      body: requestJsonString
    ).then((response) {
      print(response.statusCode);
    });

    setState(() {
      this.listLength = this.listLength + 1;
    });
    tileNames.add(nameController.text);
    tileCooks.add(cookController.text);
    tileLocations.add(locationController.text);
  }

  
  void _showCheckout() {
    Navigator.pushReplacementNamed(context, '/checkout');
  }

}

class _Tile extends StatefulWidget{
  String name;
  String cook;
  String location;
  int rating;

  _Tile({Key key, this.name, this.cook, this.location, this.rating}) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<_Tile> {

  @override
  Widget build(BuildContext context){
    return ListTileTheme(
      selectedColor: Colors.white,
          child: ListTile(
        onTap: _showDish,
        leading: Image.asset('Lasagna.jfif'),
        title: Text(widget.name),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${widget.cook}', textAlign: TextAlign.left),
                Text('${widget.location}', textAlign: TextAlign.right)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('${widget.rating.toString()}', textAlign: TextAlign.left),
              ],
            )
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
  void _showDish() {
    Navigator.pushNamed(context, '/lasagna'); //TODO make customizable
}
}