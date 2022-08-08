import 'package:flutter/material.dart';

class Form_Element extends StatefulWidget {
  const Form_Element({Key? key}) : super(key: key);

  @override
  State<Form_Element> createState() => _Form_ElementState();
}

class _Form_ElementState extends State<Form_Element> {
  List<String> items = ["Rotate", "Expire", "Introduce", "Operate"];
  var dropdownValue = "Rotate";
  Object? gender = false;
  bool checkValue = false;
  bool checkValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Form Element"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "First Name"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  decoration: InputDecoration(
                hintText: "Fisrt Name",
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Fisrt Name",
                      labelText: "Fisrt Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ///////////////Dropdown//////////////
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButton(
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  icon: Icon(Icons.arrow_drop_down_circle_outlined),
                  isExpanded: true,
                  value: dropdownValue,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //////Radio Button
              ListTile(
                  title: Text("Male"),
                  leading: Radio(
                      toggleable: true,
                      value: 0,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      })),
              //////Radio Button
              ListTile(
                  title: Text("Female"),
                  leading: Radio(
                      toggleable: true,
                      value: 1,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      })),
              SizedBox(
                height: 20,
              ),
              ////////////Check Box
              ListTile(
                title: Text("Beef"),
                leading: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      checkValue = value!;
                    });
                  },
                  value: checkValue,
                ),
              ),
              ListTile(
                title: Text("mutton"),
                leading: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      checkValue2 = value!;
                    });
                  },
                  value: checkValue2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /////////////// Progress Indicator
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
