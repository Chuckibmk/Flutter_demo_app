import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImager extends StatefulWidget {
  const PickImager({Key? key}) : super(key: key);

  @override
  State<PickImager> createState() => _PickImagerState();
}

class _PickImagerState extends State<PickImager> {
  ImagePicker picker = ImagePicker();
  var _image;
  // int option = 1;

  void pickImage() async {
    // if (option == 1) {
    var xfile = await picker.pickImage(source: ImageSource.gallery);
    _image = File(xfile!.path);
    setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 200,
                  child: _image != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(_image!),
                        )
                      : CircleAvatar(),
                ),
                Container(
                    margin: EdgeInsets.only(top: 150, right: 100),
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: Icon(Icons.camera)))
              ],
            )
          ],
        ));
  }
}
