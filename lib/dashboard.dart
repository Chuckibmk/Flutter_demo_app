import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  String firstname;
  String password;
  String about;
  String qualification;
  String gender;
  bool agree_to_terms;

  DashBoard(
      {required this.firstname,
      required this.password,
      required this.qualification,
      required this.gender,
      required this.agree_to_terms,
      required this.about});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.firstname),
          centerTitle: true,
        ),
        body: Container(
            child: Stack(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.blueAccent,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.firstname,
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
                      alignment: Alignment.center,
                      height: 80,
                      child: Text(
                        "Balance: 5000 USD",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          ///////////////////
                          Text("Firstname : " + widget.firstname,
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          ///////////////////////////
                          ////////////////////////
                          Text("Password: " + widget.password,
                              style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          //////////////////////////
                          Text("Qualification " + widget.qualification,
                              style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          //////////////////////
                          Text(
                              widget.gender == "0"
                                  ? "Gender : Male"
                                  : "Gender : Female",
                              style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          ///////////////////////
                          Text("About : " + widget.about,
                              style: TextStyle(fontSize: 18)),
                          SizedBox(height: 5),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ])));
  }
}
