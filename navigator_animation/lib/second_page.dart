import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final Widget child;

  SecondPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('Second Page',style:TextStyle(fontSize: 36.0)),
        elevation: 4.0,
        
        backgroundColor:Colors.pinkAccent,
        leading: Container(),
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}