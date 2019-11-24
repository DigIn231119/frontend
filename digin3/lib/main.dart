import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'customer.dart';
import 'test.dart';
import 'home.dart';
import 'test2.dart';
import 'lasagna.dart';
import 'signup.dart';
import 'checkout.dart';
import 'fishandchips.dart';
import 'ice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/customer': (context) => Customer(),
          '/test': (context) => Data(),
          '/home': (context) => Home(),
          '/test2': (context) => Test2(),
          '/lasagna' : (context) => Lasagna(),
          '/signup': (context) => SignUp(),
          '/FaC': (context) => FaC(),
          '/ice': (context) => Ice(),
          '/checkout': (context) => Checkout(),
        }
    );
  }
}