import 'package:flutter/material.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/home_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  final Widget child;

  BottomNavigationWidget({Key key, this.child}) : super(key: key);
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();

}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor =Colors.blue;
  int _currentIndex = 0;
  List<Widget> tabBodies = List();
  @override 
  void initState() {
    super.initState();
    tabBodies
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen());
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: tabBodies[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Home',
                    style:TextStyle(color: _BottomNavigationColor)
                  )
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.email,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Email',
                    style:TextStyle(color: _BottomNavigationColor)
                  )
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.pages,
                    color: _BottomNavigationColor,
                  ),
                  title: Text(
                    'Pages',
                    style:TextStyle(color: _BottomNavigationColor)
                  )
                ),
            ],
            currentIndex: _currentIndex,
            onTap: (int index){
                setState(() {
                  _currentIndex = index;
             });
            },
          ),
        );
  }
}