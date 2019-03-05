import 'package:flutter/material.dart';
import 'my_bottom_bar.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  final Widget child;
  
  MyApp({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '自定义底部导航栏',
        //自定义主题样式
        theme: ThemeData(
          primarySwatch: Colors.lightBlue
          
        ),
        home:MyBottomBar(),
    );
  }
}
