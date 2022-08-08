import 'package:firstproject/add_firebase_todo.dart';
import 'package:firstproject/listTodo.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class FireBasTodo extends StatefulWidget {
  const FireBasTodo({Key? key}) : super(key: key);

  @override
  State<FireBasTodo> createState() => _FireBasTodoState();
}

class _FireBasTodoState extends State<FireBasTodo> {
  int currentIndex = 0;
  List<Widget> items = [ListTodo(), AddFirebaseTodo()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Todo")),
      body: items[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          ]),
    );
  }
}
