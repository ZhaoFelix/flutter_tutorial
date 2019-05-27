import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todolist/todolist_widget.dart';

void main() { 
 // SystemChrome.setEnabledSystemUIOverlays([]);   //隐藏导航栏
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      home: TodoList(),
      );
  }
}