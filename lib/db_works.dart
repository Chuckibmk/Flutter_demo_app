import 'package:firstproject/database.dart';
import 'package:flutter/material.dart';

class DBWorks extends StatefulWidget {
  const DBWorks({Key? key}) : super(key: key);

  @override
  State<DBWorks> createState() => _DBWorksState();
}

class _DBWorksState extends State<DBWorks> {
  List<Map> data = [];
  fetchData() async {
    data = await DatabaseHelper().selectUser();
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  TextEditingController namctr = TextEditingController();
  TextEditingController gradctr = TextEditingController();
  TextEditingController namctr1 = TextEditingController();
  TextEditingController gradctr2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database Works"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: size.height / 2,
            child: data.isEmpty
                ? const Center(
                    child: Text("No records"),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Student(data[index]);
                    },
                  ),
          ),
          Container(
            width: size.width,
            height: size.height / 3,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Name"),
                      controller: namctr,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Empty field";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Grade"),
                      controller: gradctr,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Empty field";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          int result = await DatabaseHelper().insert(
                              {"name": namctr.text, "grade": gradctr.text});
                          if (result > 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Success")));
                            fetchData();
                            namctr.clear();
                            gradctr.clear();
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Failed")));
                          }
                        }
                      },
                      child: Text("Save"),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget Student(student) {
    return Container(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: ListTile(
            leading: InkWell(
              onTap: () {
                updatedata(context, student);
              },
              child: CircleAvatar(child: Icon(Icons.edit)),
            ),
            title: Text(student["name"],
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(student["grade"]),
            trailing: InkWell(
              onTap: () {
                deletedata(context, student);
              },
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            )),
      ),
    );
  }

  deletedata(BuildContext context, coin) {
    Widget okButton = MaterialButton(
      color: Colors.greenAccent,
      textColor: Colors.white,
      onPressed: () async {
        int result = await DatabaseHelper().delete(coin["id"]);
        if (result > 0) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Deleted")));
          fetchData();
          namctr.clear();
          gradctr.clear();
          setState(() {});
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Failed")));
        }
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

  updatedata(BuildContext context, dupe) {
    var alertDialg = AlertDialog(
      titlePadding: EdgeInsets.zero,
      // actions: [],
      title: Container(
        child: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text("Update Data"),
          ),
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
          Container(
            child: Form(
                key: _formKey1,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: dupe["name"]),
                      controller: namctr1,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Empty field";
                        }
                      },
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: dupe["grade"]),
                      controller: gradctr2,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Empty field";
                        }
                      },
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey1.currentState!.validate()) {
                          int result = await DatabaseHelper().update(
                              {"name": namctr1.text, "grade": gradctr2.text},
                              dupe["id"]);
                          if (result > 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Update Success")));
                            fetchData();
                            namctr1.clear();
                            gradctr2.clear();
                            setState(() {});
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Update Failed")));
                          }
                        }
                      },
                      child: Text("Save"),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                    )
                  ],
                )),
          ),
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
