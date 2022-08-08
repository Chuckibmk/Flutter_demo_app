// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthentication extends StatefulWidget {
  const FireBaseAuthentication({Key? key}) : super(key: key);

  @override
  State<FireBaseAuthentication> createState() => _FireBaseAuthenticationState();
}

class _FireBaseAuthenticationState extends State<FireBaseAuthentication> {
  var _formKey = GlobalKey<FormState>();
  String username = "";
  String email = "";
  String password = "";
  String phonenumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(label: Text("Username")),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Fill this Field";
                      }
                    },
                    onSaved: (input) {
                      username = input!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Email")),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Fill this Field";
                      }
                    },
                    onSaved: (input) {
                      email = input!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Phone Number")),
                    validator: (input) {
                      if (input!.trim().length < 11) {
                        return "Fill this Field";
                      }
                    },
                    onSaved: (input) {
                      phonenumber = input!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Password")),
                    validator: (input) {
                      if (input!.trim().length < 6) {
                        return "Fill this Field";
                      }
                    },
                    onSaved: (input) {
                      password = input!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        FirebaseAuth firebaseAuth = await FirebaseAuth.instance;

                        try {
                          UserCredential userCredential =
                              await firebaseAuth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (userCredential.user != null) {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(userCredential.user!.uid)
                                .set({
                              "username": username,
                              "email": email,
                              "password": password,
                              "id": userCredential.user!.uid
                            });
                            showSnackBar("Success");
                          } else {
                            showSnackBar("Other issues");
                          }
                        } catch (e) {
                          print(e);
                          showSnackBar(e.toString());
                        }
                      }
                    },
                    child: Text("Register"),
                    textColor: Colors.white,
                    color: Colors.blue,
                  )
                ],
              ),
            )),
      ),
    );
  }

  showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
