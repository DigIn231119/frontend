import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops:[0.1, 0.5,],
            colors: [Color(0xff7d9b09),Colors.white]
          )
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              child:
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Food'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Location'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Time'),
                    ),
                  ),
            SizedBox(
              width: 300,
              height: 50,
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
                child: Text('Dig In!'),
                onPressed: find,
              ),
            ),
             ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 100,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.asset('chinese.jpg'),
                    )
                    ),
                  ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 100,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.asset('italian.png'),
                    )
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.asset('indian.jpg'),
                    )
                    ),
                  ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.asset('japanese.jpg'),
                    )
                    ),
                  ),
          ],
            ),
          ],
        ),
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
                ),
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
                          decoration: InputDecoration(labelText: 'Dish Name'),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter a value';
                            }
                          },
                          // onSaved: (input) => name = input,
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
                          // onSaved: (input) => cookname = input,
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
                          // onSaved: (input) => location = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          // controller: cookController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Enter a value';
                            }
                          },
                          // onSaved: (input) => cookname = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Time'),
                          // onSaved: (input) => time = input,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text('Create'),
                          onPressed: () => Navigator.pushNamed(context, '/home'),
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

  void find() {
    Navigator.pushNamed(context, '/customer');
  }

}