import 'package:flutter/material.dart';
import 'each_view.dart';

class MyBottomBar extends StatefulWidget {
  final Widget child;

  MyBottomBar({Key key, this.child}) : super(key: key);

  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  List<Widget> _eachView;
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView =List();
    _eachView..add(EachView('HOME'))..add(EachView('PAGES'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return EachView('New Page');
            }));
          },
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
                  setState(() {
                    _index=0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.pages),
                color: Colors.white,
                onPressed: (){
                  setState(() {
                    _index=1;
                  });
                },
              )
            ],
          ),
        ),
    );
  }
}