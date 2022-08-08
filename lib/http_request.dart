import 'dart:convert';

import 'package:firstproject/http_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HTTPRequest extends StatefulWidget {
  const HTTPRequest({Key? key}) : super(key: key);

  @override
  State<HTTPRequest> createState() => _HTTPRequestState();
}

class _HTTPRequestState extends State<HTTPRequest> {
  List users = [];

  void fetchusersonline() async {
    var request =
        await http.get(Uri.parse("https://reqres.in/api/users?page=1"));

    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);
      users = response["data"];
      setState(() {});
      print(response);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error occured ${request.statusCode}")));
    }
  }

  @override
  void initState() {
    fetchusersonline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HTTP Request")),
        body: users.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (ctx, index) {
                  return Student(users[index]);
                }));
  }

  Widget Student(student) {
    return Container(
        child: Card(
            elevation: 5,
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(student["avatar"]),
                  // child: Image.network(student["avatar"]),
                ),
                title: Text(student["first_name"],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(student["email"]),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HTTPPage(
                            fname: student["first_name"],
                            lname: student["last_name"],
                            email: student["email"],
                            avat: student["avatar"],
                          )));
                })));
  }
}
