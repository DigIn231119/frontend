import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
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
                      onPressed: _login,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                      ),
                      child: Text('Log In'),
                    ),
                ),
                FlatButton(
                  child: Text('Sign Up?', style: TextStyle(fontSize: 12),),
                  onPressed: () => Navigator.pushNamed(context, '/signup')
                )
              ],
            )
          )
        ],)
    );
  }

  void _login() {
    if(_formKey.currentState.validate()){
    if(_email == 'homecook'){
      Navigator.pushNamed(context, '/homecook');
    } else if (_email == 'test') {
      Navigator.pushNamed(context, '/test');
    } else {
      Navigator.pushNamed(context, '/home');
    }
    }
  }
}