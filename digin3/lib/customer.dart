import 'package:flutter/material.dart';

class Customer extends StatefulWidget {
  CustomerState createState() => CustomerState();
}

class CustomerState extends State<Customer> with TickerProviderStateMixin {

  TabController controller;
  int listLength = 0;
  final GlobalKey _formKey = GlobalKey<FormState>();
  String name = '1';
  String location = '2';
  String cookname = '3';
  String time = '4';

  @override
  void initState(){
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.find_in_page)),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: this.listLength,
        itemBuilder: (context, index) => _Tile(name: name, cook:cookname, location: location),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
                          decoration: InputDecoration(labelText: 'Time'),
                          onSaved: (input) => time = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text('Create'),
                          onPressed: _addItem,
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
    );
  }

  void _addItem(){
    setState(() {
      this.listLength = this.listLength +1;
    });
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
    return ListTile(
      leading: FlutterLogo(size:72.0),
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
    );
  }
}