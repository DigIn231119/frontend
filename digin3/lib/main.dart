import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'customer.dart';
import 'test.dart';

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
        }
    );
  }
}