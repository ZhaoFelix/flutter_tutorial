import 'package:flutter/material.dart';
import 'first_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: new ThemeData(
        // primarySwatch: Colors.white
        primaryColor: Colors.white,
        
      ),
      home: FirstPage(),
    ); 
  }
}