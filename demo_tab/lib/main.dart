import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '底部导航栏',
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}
