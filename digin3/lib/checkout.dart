import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  CheckoutState createState() => CheckoutState();
}
class CheckoutState extends State<Checkout> {

  List names = ['Lasagna',];
  List cooks = ['Mary',];
  List locations = ['Manchester'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff7d9b09),
        child: Text('Pay', style: TextStyle(fontSize: 20),)
      ),
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color(0xff7d9b09),
      ),

      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => _Tile(name: names[index], cook:cooks[index], location: locations[index],),
      ),
    );
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
    Navigator.pushNamed(context, '/dish'); //TODO make customizable
}
}