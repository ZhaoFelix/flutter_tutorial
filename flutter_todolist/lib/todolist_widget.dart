import 'package:flutter/material.dart';
import 'package:flutter_todolist/todo.dart';
import 'package:flutter_todolist/newtodo_widget.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [
    Todo(title: "Learn Dart"),
    Todo(title: "Try Flutter"),
    Todo(title: "Be amzed")
  ];

  Widget _buildItem(BuildContext context,int index){
      final todo = todos[index];
      return CheckboxListTile(
        value: todo.isDone,
        title: Text(todo.title),
        onChanged: (bool isChecked){
          _toogleTodo(todo,isChecked);
        },
      );
  }
  _toogleTodo(Todo todo,bool isChecked){
    // print('${todo.title} ${todo.isDone}');
    // todo.isDone = isChecked;
    setState(() {
      todo.isDone = isChecked;
    });
  }
  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context){
       return NewTodoDialog();
      }
    );
    if(todo != null){
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: _buildItem,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}