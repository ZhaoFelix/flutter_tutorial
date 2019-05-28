import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
  if(Platform.isAndroid){
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
class MyApp extends StatelessWidget {
  final editController = TextEditingController();
  String image_url = "https://ws1.sinaimg.cn/large/0065oQSqgy1fze94uew3jj30qo10cdka.jpg";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is a demo'),
          leading: Icon(Icons.home),
          backgroundColor: Colors.red,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_a_photo),
              tooltip: 'Add photo',
              onPressed: (){
                  print('text inputted:${editController.text}');
                  // Fluttertoast.showToast(
                  //   msg: 'text inputted:${editController.text}',
                  //   toastLength: Toast.LENGTH_SHORT,
                  //   gravity: ToastGravity.CENTER,
                  //   timeInSecForIos: 1
                  // );
              },
            ),
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context){
                return <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: 'one',
                    child: Text('This one'),
                  ),
                  PopupMenuItem<String>(
                    value: 'two',
                    child: Text('This two'),
                  ),
                ];
              },
              onSelected: (String action){
                switch (action){
                  case "one":
                    break;
                  case "two":
                    break;
                }
              },
            )
          ],
        ),
        body: Center(
          // child: TextFieldWidget(editController),
          // child: ImageWidget(image_url),
          // child: ImageCachedWidget(image_url),
          child: FlatButtonWidget(),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 10.0),
            children: <Widget>[
              ListTile(
                title: Text("This is Item_one"),
                leading: CircleAvatar(child: Icon(Icons.scanner)),
              ),
              ListTile(
                title: Text("This is Item_two"),
                leading: CircleAvatar(child: Icon(Icons.list)),
              ),
              ListTile(
                title: Text("This is Item_three"),
                leading: CircleAvatar(child: Icon(Icons.score)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(this.controller);
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 26,
      maxLines: 1,
      autocorrect: true,
      autofocus: true,
      obscureText: true,
      textAlign: TextAlign.center,
    );
  }
}

//加载网络图片
class ImageWidget extends StatelessWidget {
  String imageUrl;
  ImageWidget(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}

//缓存数据
class ImageCachedWidget extends StatelessWidget {
  String image_url;
  ImageCachedWidget(this.image_url);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image_url,
      placeholder: CircularProgressIndicator(),
      //加载错误时显示的图片
      errorWidget: Icon(Icons.error),
      width: 200,
      height: 200,
    );
  }
}

//FlatButton
class FlatButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){

      },
      child: Text('FlatButton'),
      color: Colors.blue,
      textColor: Colors.white,
      onHighlightChanged: (bool b){
        //水波纹回调
        print("回调");
      },
      disabledColor: Colors.black, //按钮禁用时的显示颜色
      disabledTextColor: Colors.black38,
      splashColor: Colors.white, //水波纹的颜色
    );
  }
}