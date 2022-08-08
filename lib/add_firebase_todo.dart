import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AddFirebaseTodo extends StatefulWidget {
  Map? user;
  AddFirebaseTodo({Key? key, this.user}) : super(key: key);

  @override
  State<AddFirebaseTodo> createState() => _AddFirebaseTodoState();
}

class _AddFirebaseTodoState extends State<AddFirebaseTodo> {
  String? name, job, salary;
  bool isLoading = false;
  var _FormKey = GlobalKey<FormState>();
  bool isEdit = false;
  var nameCtrl = TextEditingController();
  var jobCtrl = TextEditingController();
  var salaryCtrl = TextEditingController();
  assignValuesTofield() {
    if (widget.user != null) {
      setState(() {
        isEdit = true;
      });
      nameCtrl.text = widget.user!["name"];
      jobCtrl.text = widget.user!["job"];
      nameCtrl.text = widget.user!["salary"];
    }
  }

  @override
  void initState() {
    assignValuesTofield();
    //TODO: implement initstate
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Firebase Todo")),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        child: Form(
            key: _FormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Fill this Field";
                    }
                  },
                  onSaved: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(label: Text("Name")),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: jobCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Fill this Field";
                    }
                  },
                  onSaved: (value) {
                    job = value;
                  },
                  decoration: InputDecoration(label: Text("Job")),
                ),
                TextFormField(
                  controller: salaryCtrl,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Fill this Field";
                    }
                  },
                  onSaved: (value) {
                    salary = value;
                  },
                  decoration: InputDecoration(label: Text("Salary")),
                ),
                SizedBox(height: 10),
                Visibility(
                    visible: isLoading, child: CircularProgressIndicator()),
                MaterialButton(
                  onPressed: () {
                    if (_FormKey.currentState!.validate()) {
                      _FormKey.currentState!.save();
                      setState(() {
                        isLoading = true;
                      });
                      var date = DateTime.now().toString();
                      try {
                        if (!isEdit) {
                          FirebaseFirestore.instance
                              .collection("staffs")
                              .doc()
                              .set({
                            "name": name,
                            "job": job,
                            "createdAt": date,
                            "salary": salary
                          });
                        } else {
                          FirebaseFirestore.instance
                              .collection("staffs")
                              .doc(widget.user!["id"])
                              .update(
                                  {"name": name, "job": job, "salary": salary});
                        }
                        setState(() {
                          isLoading = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(isEdit
                                  ? "${name} Update"
                                  : "${name} Registered")));
                        });
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Error occurred ${e.toString()}")));
                        });
                      }
                    }
                  },
                  child: !isEdit ? Text("Submit") : Text("Update"),
                  color: Colors.blue,
                  textColor: Colors.white,
                )
              ],
            )),
      ),
    );
  }
}
