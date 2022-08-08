import 'package:flutter/material.dart';

class HTTPPage extends StatefulWidget {
  // const HTTPPage({Key? key}) : super(key: key);

  // List users = [];

  String fname;
  String lname;
  String avat;
  String email;

  HTTPPage({
    required this.fname,
    required this.lname,
    required this.avat,
    required this.email,
  });

  @override
  State<HTTPPage> createState() => _HTTPPageState();
}

class _HTTPPageState extends State<HTTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    image: DecorationImage(
                      image: NetworkImage(widget.avat),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.avat),
                          radius: 40,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.fname + " " + widget.lname,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 165, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            ///////////////////
                            Text("Email : " + widget.email,
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            ////////////////////////
                            Text("Firstname : " + widget.fname,
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            ////////////////////////
                            Text("Lastname: " + widget.lname,
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: 10),
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
