import 'package:flutter/material.dart';
import '../models/to_do.dart';

class TodoItem extends StatelessWidget {
  final ToDo toDo;
  final onTodoChange;
  final onTodoDelete;


  const TodoItem({Key? key, required this.toDo, required this.onTodoChange, required this.onTodoDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onTodoChange(toDo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.amber,
          leading: Icon(
            toDo.isDone? Icons.check_box : Icons.check_box_outline_blank),
          title: Text(
            toDo.todo!, 
            style: TextStyle(
              fontSize: 16,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 1),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 20,
              icon: Icon(Icons.delete),
              onPressed: () {onTodoDelete(toDo.id);},
            ),
          ),
        ));
  }
}
