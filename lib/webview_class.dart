import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firstproject/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewClass extends StatefulWidget {
  // const WebViewClass({Key? key}) : super(key: key);

  @override
  State<WebViewClass> createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {
  String webname = "";
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  // var progress = 0;

  var _formKey = GlobalKey<FormState>();
  String erro_msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Browser App")),
        body: Container(
            child: Container(
                margin: EdgeInsets.all(15),
                child: Column(children: [
                  Container(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Goto URL",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    suffixIcon: IconButton(
                                        // onPressed: () => webname.clear(),
                                        onPressed: () {
                                          setState(() {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        view(webname)),
                                                // Web(webname)),
                                              );
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.search))),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Url cannot be empty";
                                  }
                                },
                                onSaved: (value) {
                                  webname = value!;
                                })
                          ],
                        )),
                  ),
                  // Expanded(
                  //   child: Web(webname),
                  // )
                ]))));
  }

  // Web(webname) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Container(
  //           child: progress < 1.0
  //               ? LinearProgressIndicator(
  //                   value: progress / 100.0,
  //                   backgroundColor: Colors.amber,
  //                 )
  //               : Container(),
  //         ),
  //         SizedBox(height: 5),
  //         Expanded(
  //           child: WebView(
  //               // initialUrl: 'https://google.com',
  //               initialUrl: webname,
  //               onWebViewCreated: (WebViewController webviewController) {
  //                 _completer.complete(webviewController);
  //               },
  //               onPageStarted: (url) {
  //                 setState(() {
  //                   progress = 0;
  //                 });
  //               },
  //               onProgress: (progress) {
  //                 setState(() {
  //                   progress = progress;
  //                 });
  //               },
  //               onPageFinished: (url) {
  //                 setState(() {
  //                   progress = 100;
  //                 });
  //               },
  //               javascriptMode: JavascriptMode.unrestricted,
  //               navigationDelegate: (NavigationRequest request) {
  //                 return NavigationDecision.navigate;
  //               }),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
