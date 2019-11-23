import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends StatefulWidget{
  DataState createState() => DataState();
}

class DataState extends State<Data> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    String dropdownValue = null;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'dish name',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'cook name',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'location',
              ),
            ),
            SizedBox(
              width: 300,  
              height: 75,
              child: DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState((){
                    dropdownValue = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('1'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('2'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('3'),
                  ),
                  DropdownMenuItem(
                    value: '4',
                    child: Text('4'),
                  ),
                  DropdownMenuItem(
                    value: '5',
                    child: Text('5'),
                  )
                ] 
              ),
            ),
            RaisedButton(
              child: Text('OK'),
              onPressed: fetchPost,
            )
          ],
        ),
      )
    );
  }

  Future<http.Response> fetchPost() {
    return http.get('https://digin-backend.appspot.com');
  }
}