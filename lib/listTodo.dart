import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/add_firebase_todo.dart';
import 'package:http/http.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({Key? key}) : super(key: key);

  @override
  State<ListTodo> createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("staffs")
              .orderBy("createdAt", descending: false)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return Center(child: Text("No Data"));
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error"));
            }

            var data = (snapshot.data! as dynamic).docs;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Text(data[index]["name"]
                              .toString()
                              .trim()
                              .substring(0, 1)
                              .toUpperCase())),
                      title: Text(data[index]["name"]),
                      subtitle: Text(
                          data[index]["job"] + " USD" + data[index]["salary"]),
                      trailing: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              onPressed: () {
                                Map user = {};
                                user["name"] = data[index]["name"];
                                user["job"] = data[index]["job"];
                                user["salary"] = data[index]["salary"];
                                user["id"] = data[index].id;

                                askForDelet(context, user);
                              },
                              icon: Icon(Icons.cancel)),
                          IconButton(
                              onPressed: () {
                                Map user = {};
                                user["name"] = data[index]["name"];
                                user["job"] = data[index]["job"];
                                user["salary"] = data[index]["salary"];
                                user["id"] = data[index].id;
                                // print(user);
                                var route = MaterialPageRoute(
                                    builder: (BuildContext) => AddFirebaseTodo(
                                          user: user,
                                        ));
                                Navigator.push(context, route);
                              },
                              icon: Icon(Icons.edit))
                        ]),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  askForDelet(BuildContext context, user) {
    Widget okButton = MaterialButton(
      color: Colors.greenAccent,
      textColor: Colors.white,
      onPressed: () {
        // int result =
        FirebaseFirestore.instance
            .collection("staffs")
            .doc(user!["id"])
            .delete()
            .then((value) => {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Deleted"))),
                  Navigator.pop(context),
                  setState(() {})
                });
      },
      child: Text("Yes"),
    );

    Widget continueBTN = MaterialButton(
      color: Colors.redAccent,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("No"),
    );

    var alertDialg = AlertDialog(
      titlePadding: EdgeInsets.zero,
      actions: [okButton, continueBTN],
      title: Container(
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Text("Delete From Database"),
        ]),
      ),
      // content: Text("No Reverse after this action"),
      backgroundColor: Colors.white,
    );
    showDialog(
        context: context,
        builder: (ctx) {
          return alertDialg;
        });
  }
}
