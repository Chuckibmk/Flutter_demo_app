import 'package:flutter/material.dart';

class LayoutTutorial extends StatefulWidget {
  const LayoutTutorial({Key? key}) : super(key: key);

  @override
  State<LayoutTutorial> createState() => _LayoutTutorialState();
}

class _LayoutTutorialState extends State<LayoutTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.blueAccent,
                child: Center(child: Text("Layout 1")),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.blueAccent,
                child: Center(child: Text("Layout 2")),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.blueAccent,
                child: Center(child: Text("Layout 3")),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    color: Colors.blueAccent,
                    child: Center(child: Text("Layout 1")),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    color: Colors.blueAccent,
                    child: Center(child: Text("Layout 2")),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    width: 120,
                    height: 50,
                    color: Colors.blueAccent,
                    child: Center(child: Text("Layout 1")),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    color: Colors.blueAccent,
                    child: Center(child: Text("Layout 2")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    color: Colors.blueAccent,
                    child: Center(child: Text("Layout 3")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
