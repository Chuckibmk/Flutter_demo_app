import 'package:flutter/material.dart';

class AlertDialoClass extends StatefulWidget {
  const AlertDialoClass({Key? key}) : super(key: key);

  @override
  State<AlertDialoClass> createState() => _AlertDialoClassState();
}

class _AlertDialoClassState extends State<AlertDialoClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Alert Dialog Tutorial"), centerTitle: true),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text("Show Alert Dialog"),
            color: Colors.blueAccent,
            textColor: Colors.white,
          ),
          MaterialButton(
            onPressed: () {
              showAlert2Actions(context);
            },
            child: Text("Show Alert Dialog 2"),
            color: Colors.blueAccent,
            textColor: Colors.white,
          )
        ])));
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Ok Sir"));
    AlertDialog alertDialog = AlertDialog(
      title: Text("We are showing alert"),
      content: Text("This alert is from Digital Dreams Otigba Branch"),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (ctx) {
          return alertDialog;
        });
  }

  showAlert2Actions(BuildContext context) {
    Widget okButton = MaterialButton(
      color: Colors.greenAccent,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Continue"),
    );

    Widget continueBTN = MaterialButton(
      color: Colors.redAccent,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Delete"),
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
          Text("You are About to delete"),
        ]),
      ),
      content: Text("No Reverse after this action"),
      backgroundColor: Colors.white,
    );
    showDialog(
        context: context,
        builder: (ctx) {
          return alertDialg;
        });
  }
}
