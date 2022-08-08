import 'package:flutter/material.dart';

class LayoutPractical extends StatefulWidget {
  const LayoutPractical({Key? key}) : super(key: key);

  @override
  State<LayoutPractical> createState() => _LayoutPracticalState();
}

class _LayoutPracticalState extends State<LayoutPractical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Design Practicals"),
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              child: Card(
                elevation: 5.0,
                margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Container(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 10,
                          ),
                          title: Text("Autor: Emeka"),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "This is the title of the post",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Image.asset(
                          'assets/images/anna.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis esse officia illum aperiam molestiae, voluptatem deserunt laboriosam a ad reiciendis atque. Suscipit dolorum vitae molestiae molestias, neque eum. Eos, necessitatibus.",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
