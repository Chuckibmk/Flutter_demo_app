import 'package:firstproject/alert_dialog.dart';
import 'package:firstproject/pick_image.dart';
import 'package:firstproject/todo_list.dart';
import 'package:flutter/material.dart';

class ButtomNavClass extends StatefulWidget {
  const ButtomNavClass({Key? key}) : super(key: key);

  @override
  State<ButtomNavClass> createState() => _ButtomNavClassState();
}

class _ButtomNavClassState extends State<ButtomNavClass> {
  PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation Bar")),
      body: PageView(
        controller: _controller,
        children: [
          AlertDialoClass(),
          PickImager(),
          TodoList(),
        ],
        onPageChanged: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _controller.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me")
        ],
      ),
    );
  }
}
