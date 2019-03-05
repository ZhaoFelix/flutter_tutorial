import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  final Widget child;

  MyBottomBar({Key key, this.child}) : super(key: key);

  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          tooltip: '长按显示',
          child: Icon(
            Icons.add,
            color:Colors.white
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: (){
                },
              ),
              IconButton(
                icon: Icon(Icons.pages),
                color: Colors.white,
                onPressed: (){
                },
              )
            ],
          ),
        ),
    );
  }
}