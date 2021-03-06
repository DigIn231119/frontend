import 'package:flutter/material.dart';

class Customer extends StatefulWidget {
  CustomerState createState() => CustomerState();
}

class CustomerState extends State<Customer> with TickerProviderStateMixin {

  TabController controller;
  int listLength = 4;
  final _formKey = GlobalKey<FormState>();

  List tileImages = ['Lasagna.jfif', 'burritos.jpg', 'sushi.jpg', 'FaC.jpg'];
  List tileNames = ['Lasagna', 'Burritos', 'Sushi', 'Fish and Chips'];
  List tileLocations = ['Manchester', 'London', 'Dublin', 'Liverpool'];
  List cookNames = ['Mary', 'Jeffrey', 'Aron', 'Jack'];

  

  TextEditingController nameController = TextEditingController();
  TextEditingController cookController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // List tileNames = [];
  List tileCooks = [];
  // List tileLocations = [];

  String name;
  String location;
  String cookname;
  String time;
  String quanity;

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
        itemBuilder: (context, index) => _Tile(image: tileImages[index] ,name: tileNames[index], cook: cookNames[index], location: tileLocations[index])
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
                          onSaved: (input) => quanity = input,
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
                          onSaved: (input) => cookname = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Time(hh:mm) & Date(dd/mm/yy)'),
                          keyboardType: TextInputType.datetime,
                          onSaved: (input) => time = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text('Create'),
                          onPressed: () {
                            // Navigator.pushNamed(context, '/customer');
                            if(_formKey.currentState.validate()) {
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

  void _addItem(){
    setState(() {
      this.listLength = this.listLength +1;
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
  String image;

  _Tile({Key key, this.name, this.cook, this.location, this.rating, this.image}) : super(key: key);

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
        leading: Image.asset(widget.image),
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
                // Text('${widget.rating.toString()}', textAlign: TextAlign.left),
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