import '../widgets/todo_item.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ToDo> todoList = ToDo.todoList();
  List<ToDo> _FoundToDo = [];
  final _todoController = TextEditingController();

  void _handleToDoChange(ToDo todo) {
    setState(() {
      _FoundToDo = todoList;
      List<ToDo> updatedTodoList = todoList.map((item) {
        if (item.id == todo.id) {
          print(item.isDone);
          return ToDo(
            id: item.id,
            todoText: item.todoText,
            isDone: !item.isDone,
          );
        } else {
          return item;
        }
      }).toList();
      todoList = updatedTodoList;
      print(todo.isDone);
    });
  }

  void _handleDeleteItem(String? id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 20),
                        child: Text(
                          'All TODos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _FoundToDo)
                        ToDoItem(
                          todo: todo,
                          onToDoChange: (isDone) {
                            _handleToDoChange(todo);
                          },
                          onDeleteItem: (id) {
                            _handleDeleteItem(id);
                          },
                        ),
                    ],
                  ),
                )
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add a new item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void_deleteToDoItem() {

  // }
  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ),
      );
    });
    _todoController.clear();
  }

  void _runFilten(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    print(results);
    setState(() {
      _FoundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(52, 122, 16, 16), // Updated color value
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) {
          _runFilten(value); // Call _runFilten method when text changes
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white, // Updated color value
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'search',
          hintStyle: TextStyle(color: Colors.white), // Updated color value
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: white,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/oli.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
