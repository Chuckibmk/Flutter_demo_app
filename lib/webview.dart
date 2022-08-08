import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class view extends StatefulWidget {
  // const view(, {Key? key}) : super(key: key);
  String webname;

  view(this.webname);
  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  var progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.webname)),
        body: Container(
            child: Container(
                margin: EdgeInsets.all(15),
                child: Column(children: [
                  Container(
                    child: progress < 1.0
                        ? LinearProgressIndicator(
                            value: progress / 100.0,
                            backgroundColor: Colors.amber,
                          )
                        : Container(),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: WebView(
                        // initialUrl: 'https://google.com',
                        initialUrl: widget.webname,
                        onWebViewCreated:
                            (WebViewController webviewController) {
                          _completer.complete(webviewController);
                        },
                        onPageStarted: (url) {
                          setState(() {
                            progress = 0;
                          });
                        },
                        onProgress: (progress) {
                          setState(() {
                            progress = progress;
                          });
                        },
                        onPageFinished: (url) {
                          setState(() {
                            progress = 100;
                          });
                        },
                        javascriptMode: JavascriptMode.unrestricted,
                        navigationDelegate: (NavigationRequest request) {
                          return NavigationDecision.navigate;
                        }),
                  )
                ]))));
    //     ),
    // );
  }
}
