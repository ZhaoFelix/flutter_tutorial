import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWordsListView extends StatefulWidget {
  @override  
  _RandomWordsListViewState createState(

  ) => _RandomWordsListViewState();
}

class _RandomWordsListViewState extends 
State<RandomWordsListView> {
  final _normalWords = <WordPair>[];
  final Set<WordPair> _collected = Set<WordPair>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter')),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),onPressed: _collectedPage,)
        ],
      ),
      body: _buildNormalWordls(),
    );
  }
  Widget _buildNormalWordls(){
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      itemBuilder: (context,i){
        //添加下划线
        if(i.isOdd){
          return Divider();
        }
        final int index = i ~/ 2; 
        if(i >= _normalWords.length){
          _normalWords.addAll(generateWordPairs().take(10));
        }
       return  _buildItem(_normalWords[index]);
      },
    );
  }
  Widget _buildItem(WordPair pair){
    final bool isCollected = _collected.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textAlign:TextAlign.left,
      ),
      trailing: Icon(
        isCollected ? Icons.favorite : Icons.favorite_border,
        color:isCollected ? Colors.red : null
      ),
      onTap: (){
        setState(() {
          if(isCollected){
            _collected.remove(pair);
          }
          else {
            _collected.add(pair);
          }
        });
      },
    );
  }
  void _collectedPage(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          final Iterable<ListTile> titles = _collected.map((WordPair pair){
            return ListTile(
              title:Text(
                pair.asPascalCase
              )
            );
          }
          );
          //添加分割线
          final List<Widget> divided = ListTile.divideTiles(
            tiles: titles,
            context: context
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Collected Words')),
            ),
            body: ListView(
              children: divided,
            ),
          );
        }
      )
    );
  }
}
