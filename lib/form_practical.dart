import 'package:firstproject/dashboard.dart';
import 'package:flutter/material.dart';

class FormPrctical extends StatefulWidget {
  const FormPrctical({Key? key}) : super(key: key);

  @override
  State<FormPrctical> createState() => _FormPrcticalState();
}

class _FormPrcticalState extends State<FormPrctical> {
  String first_name = "";
  String Last_name = "";
  var qualifications = ["OND", "HND", "DEGREE", "MASTERS"];
  String qualification = "OND";
  Object? gender = 0;
  bool agreed_to_term = false;
  String about = "";
  String password = "";
  bool hide_password = false;

  void togglePassword() {
    if (hide_password) {
      hide_password = false;
      setState(() {});
    } else {
      hide_password = true;
      setState(() {});
    }
  }

  String erro_msg = "";
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practical Form",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(12),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Text("Sign up Form",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "san-serif")),
                        yspace(),
                        CircleAvatar(
                          radius: 20,
                          // child: Image.network("https://bit.ly/3yOEXbD"),
                          child: Image.asset(
                              'assets/images/3e21921d36aa493ea4f6d5f6c7d88a25.png'),
                          // child: Image.file("C:/Users/DELL/Desktop/old cmp/3e21921d36aa493ea4f6d5f6c7d88a25.png"),
                        ),
                        yspace(),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: "First name",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "First name cannot be empty";
                              }
                            },
                            onSaved: (value) {
                              first_name = value!;
                            }),
                        yspace(),
                        TextFormField(
                          obscureText: hide_password ? true : false,
                          decoration: InputDecoration(
                              labelText: "password",
                              prefixIcon: IconButton(
                                icon: hide_password
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  togglePassword();
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "password cannot be empty";
                            }
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                        ),
                        yspace(),

                        ///////////////Dropdown//////////////
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(12)),
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButton(
                            items: qualifications.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            isExpanded: true,
                            value: qualification,
                            onChanged: (value) {
                              setState(() {
                                qualification = value.toString();
                              });
                            },
                          ),
                        ),

                        /////////////////Gender Selection
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ListTile(
                                      title: Text("Male"),
                                      leading: Radio(
                                        toggleable: true,
                                        groupValue: gender,
                                        value: 0,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        },
                                      ))),
                              Expanded(
                                  child: ListTile(
                                      title: Text("Female"),
                                      leading: Radio(
                                        toggleable: true,
                                        groupValue: gender,
                                        value: 1,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        },
                                      ))),
                            ],
                          ),
                        ),
                        yspace(),

                        ///////////////////About youself
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                              maxLength: 50,
                              minLines: 3,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.edit),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  labelText: "About Yourself",
                                  hintText: "Not more than 50 charaters"),
                              onSaved: (value) {
                                setState(() {
                                  about = value!;
                                });
                              },
                              validator: (value) {
                                if (value!.trim().length < 10) {
                                  return "Write up to 10 characters";
                                }
                              }),
                        ),
                        yspace(),

                        /////////////////terms widget

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: ListTile(
                            leading: Checkbox(
                                value: agreed_to_term,
                                onChanged: (value) {
                                  setState(() {
                                    agreed_to_term = value!;
                                  });
                                }),
                            title: Text("Agree with terms and condition"),
                          ),
                        ),
                        yspace(),

                        erro_msg.length > 2
                            ? Container(
                                child: Text(
                                  erro_msg,
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : Container(),

                        yspace(),
                        ///////////////Submit Button

                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: MaterialButton(
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              shape: StadiumBorder(),
                              child: Text("Submit"),
                              onPressed: () {
                                erro_msg = "";
                                setState(() {});

                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                  if (agreed_to_term) {
                                    var route = MaterialPageRoute(
                                      builder: (BuildContext) => DashBoard(
                                          firstname: first_name,
                                          password: password,
                                          qualification: qualification,
                                          gender: gender.toString(),
                                          agree_to_terms: agreed_to_term,
                                          about: about),
                                    );
                                    Navigator.push(context, route);
                                  } else {
                                    erro_msg = "Please agree to terms";
                                  }
                                }
                                setState(() {});
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }

  Widget yspace() {
    return SizedBox(
      height: 10,
    );
  }

  Widget xspace() {
    return SizedBox(
      width: 10,
    );
  }
}
