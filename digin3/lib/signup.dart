import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7d9b09),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset('logo.png'), //TODO: logo transparent bg
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if(input.isEmpty) {
                        return 'Enter an Email';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                  child: TextFormField(
                    validator: (input) {
                      if(input.length < 6) {
                        return 'Your Password must be at least 6 characters';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    ),
                ),
                
                SizedBox(
                  width: 350,
                      child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                      ),
                      child: Text('Sign Up'),
                    ),
                ),
              ],
            )
          )
        ],)
    );
  }
}