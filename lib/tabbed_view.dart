import 'package:firstproject/form_practical.dart';
import 'package:firstproject/main.dart';
import 'package:firstproject/webview_class.dart';
import 'package:flutter/material.dart';

class TabbedView extends StatefulWidget {
  const TabbedView({Key? key}) : super(key: key);

  @override
  State<TabbedView> createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
              // leading: Container(),
              title: Text("Tab Bar Tutorials"),
              bottom: TabBar(tabs: [
                // Tab(
                //   icon: Icon(Icons.camera_alt),
                // ),
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: "Register",
                ),
                Tab(
                  icon: Icon(Icons.search),
                  text: "Browser",
                ),
              ])),
          body: TabBarView(children: [
            // ViewCamera(),
            Home(),
            FormPrctical(),
            WebViewClass()
          ])),
    );
  }
}
