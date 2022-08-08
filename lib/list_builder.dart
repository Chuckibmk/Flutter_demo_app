import 'package:flutter/material.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({Key? key}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  List<Map<String, dynamic>> students = [
    {"name": "Mark", "grade": "pass"},
    {"name": "Jude", "grade": "Excellent"},
    {"name": "John", "grade": "failed"},
    {"name": "Aust", "grade": "good"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Builder")),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, i) {
              return Student(students[i]);
            }),
      ),
    );
  }

  Widget Student(student) {
    return Container(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text(student["name"],
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(student["grade"]),
            trailing: student["grade"] == "failed"
                ? Icon(Icons.cancel, color: Colors.red)
                : InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                    ),
                  )),
      ),
    );
  }
}
