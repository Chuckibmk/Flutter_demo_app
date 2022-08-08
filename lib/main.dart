// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/alert_dialog.dart';
import 'package:firstproject/authenticatin.dart';
import 'package:firstproject/bottom_nav_class.dart';
import 'package:firstproject/carousel_slider_class.dart';
import 'package:firstproject/db_works.dart';
import 'package:firstproject/firebase_todo.dart';
import 'package:firstproject/form_element.dart';
import 'package:firstproject/form_practical.dart';
import 'package:firstproject/http_request.dart';
import 'package:firstproject/layouttutorials.dart';
import 'package:firstproject/layout_practical.dart';
import 'package:firstproject/list_builder.dart';
import 'package:firstproject/pick_image.dart';
import 'package:firstproject/speed_dail_class.dart';
import 'package:firstproject/tabbed_view.dart';
import 'package:firstproject/todo_list.dart';
import 'package:firstproject/view_camera.dart';
import 'package:firstproject/webview_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
//// if (kIsWeb) {
//// to run the initialize thru google chrome
////   await Firebase.initializeApp(options: Config.firbaseOptions);
//// } else{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

//// }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chuck App",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("First App"),
        centerTitle: true,
        actions: [Icon(Icons.settings)],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.blue,
                )),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text("Profile"),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext) => FormPrctical());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: Colors.blue,
              ),
              title: Text("Payment"),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext) => WebViewClass());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text("Settings"),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext) => AlertDialoClass());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.follow_the_signs,
                color: Colors.green,
              ),
              title: Text("Sign Up"),
              onTap: () {
                var route =
                    MaterialPageRoute(builder: (BuildContext) => TodoList());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              title: Text("Close Drawer"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => LayoutTutorial());
                          Navigator.push(context, route);
                        },
                        child: Text("Layout tutorial"),
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => LayoutPractical());
                          Navigator.push(context, route);
                        },
                        child: Text("Layout Practical"),
                        color: Colors.amber,
                        textColor: Colors.black12,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => Form_Element());
                          Navigator.push(context, route);
                        },
                        child: Text("Form Element"),
                        color: Colors.cyan,
                        textColor: Colors.black54,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => FormPrctical());
                          Navigator.push(context, route);
                        },
                        child: Text("Form Practical"),
                        color: Colors.indigo,
                        textColor: Colors.white70,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => ListBuilder());
                          Navigator.push(context, route);
                        },
                        child: Text("List Builder"),
                        color: Colors.green,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => TodoList());
                          Navigator.push(context, route);
                        },
                        child: Text("Todo List Assignment"),
                        color: Colors.brown,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => AlertDialoClass());
                          Navigator.push(context, route);
                        },
                        child: Text("Alert Dialog"),
                        color: Colors.purple,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => WebViewClass());
                          Navigator.push(context, route);
                        },
                        child: Text("Webview flutter"),
                        color: Colors.grey,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => PickImager());
                          Navigator.push(context, route);
                        },
                        child: Text("Image Picker"),
                        color: Colors.pink,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => TabbedView());
                          Navigator.push(context, route);
                        },
                        child: Text("Tabbed View"),
                        color: Colors.orange,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () async {
                          await availableCameras().then((value) =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ViewCamera(cameras: value))));
                        },
                        child: Text("Take a Picture"),
                        color: Colors.green,
                        textColor: Colors.white60,
                        // onPressed: () {
                        //   var route = MaterialPageRoute(
                        //       builder: (BuildContext) => ViewCamera());
                        //   Navigator.push(context, route);
                        // },
                        // child: Text("Camera"),
                        // color: Colors.green,
                        // textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => SpeedDailClass());
                          Navigator.push(context, route);
                        },
                        child: Text("Speed Dail Fae"),
                        color: Colors.blueAccent,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => ButtomNavClass());
                          Navigator.push(context, route);
                        },
                        child: Text("Butt Nav"),
                        color: Colors.blueGrey,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => CarouselClass());
                          Navigator.push(context, route);
                        },
                        child: Text("Carousel Slide"),
                        color: Colors.blueGrey,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => DBWorks());
                          Navigator.push(context, route);
                        },
                        child: Text("Database Works"),
                        color: Colors.blueGrey,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) =>
                                  FireBaseAuthentication());
                          Navigator.push(context, route);
                        },
                        child: Text("Firebase Authentication"),
                        color: Colors.pink,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => HTTPRequest());
                          Navigator.push(context, route);
                        },
                        child: Text("Http"),
                        color: Colors.blueGrey,
                        textColor: Colors.white60,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext) => FireBasTodo());
                          Navigator.push(context, route);
                        },
                        child: Text("db crud"),
                        color: Colors.blueGrey,
                        textColor: Colors.white60,
                      )),
                ],
              ))),
    );
  }
}
