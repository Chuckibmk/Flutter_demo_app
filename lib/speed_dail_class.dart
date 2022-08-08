import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDailClass extends StatefulWidget {
  const SpeedDailClass({Key? key}) : super(key: key);

  @override
  State<SpeedDailClass> createState() => _SpeedDailClassState();
}

class _SpeedDailClassState extends State<SpeedDailClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Speed Dial")),
      body: Center(child: Text("Speed Dial Body")),
      floatingActionButton: SpeedDial(
          overlayColor: Colors.transparent,
          overlayOpacity: 0.05,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                label: "Share", child: Icon(Icons.share), onTap: () {}),
            SpeedDialChild(
                label: "save", child: Icon(Icons.download), onTap: () {}),
            SpeedDialChild(
                label: "home", child: Icon(Icons.home), onTap: () {}),
          ]),
    );
  }
}
