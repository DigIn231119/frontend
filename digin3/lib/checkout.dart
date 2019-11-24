// import 'package:flutter/material.dart';

// class Checkout extends StatefulWidget {
//   CheckoutState createState() => CheckoutState();
// }
// class CheckoutState extends State<Checkout> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//         backgroundColor: Color(0xff7d9b09),
//       ),

//       body: ListView.builder(
//         itemCount: this.listLength,
//         itemBuilder: (context, index) => _Tile(name: tileNames[index], cook:tileCooks[index], location: tileLocations[index], route: Dish()),
//       ),

//       )
//     );
//   }
// }

// class _TileState extends State<_Tile> {

//   @override
//   Widget build(BuildContext context){
//     return ListTileTheme(
//       selectedColor: Colors.white,
//           child: ListTile(
//         onTap: _showDish,
//         leading: Image.asset('Lasagna.jfif'),
//         title: Text(widget.name),
//         subtitle: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text('${widget.cook}', textAlign: TextAlign.left),
//                 Text('${widget.location}', textAlign: TextAlign.right)
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Text('${widget.rating.toString()}', textAlign: TextAlign.left),
//               ],
//             )
//           ],
//         ),
//         isThreeLine: true,
//       ),
//     );
//   }
//   void _showDish() {
//     Navigator.pushNamed(context, '/dish'); //TODO make customizable
// }
// }