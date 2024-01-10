import 'package:flutter/material.dart';
import '../models/to_do.dart';
import '../constrains/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ToDo> todoList = [];
  List<ToDo> _founded = [];
  final _addToDolist = TextEditingController();

  @override
  void initState() {
    _founded = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _AppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                _searchbar(),
                Expanded(
                    child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25, bottom: 23),
                      child: Text(
                        "My Todos",
                        style: TextStyle(
                            fontSize: 38, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ToDo todo in _founded.reversed)
                      TodoItem(
                          toDo: todo,
                          onTodoChange: _handleTodoStatus,
                          onTodoDelete: _deleteTodoItem),
                  ],
                )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: const Color.fromARGB(255, 163, 162, 162),
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _addToDolist,
                      decoration: InputDecoration(
                        hintText: "ADD NEW TODO",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      _addtodoItem(_addToDolist.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: TBGcolor,
                        minimumSize: Size(60, 60),
                        elevation: 1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodoStatus(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void _addtodoItem(String todo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(), todo: todo));
    });
    _addToDolist.clear();
  }

  void _runFilter(String keyWord) {
    List<ToDo> result = [];
    if (keyWord.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((element) =>
              element.todo!.toLowerCase().contains(keyWord.toLowerCase()))
          .toList();
    }

    setState(() {
      _founded = result;
    });
  }

  Container _searchbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (keyWord)=>_runFilter(keyWord),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: "Search Text"),
      ),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      backgroundColor: TBGcolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/Logo.jpg')),
          )
        ],
      ),
    );
  }
}
