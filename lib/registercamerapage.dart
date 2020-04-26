import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'data.dart';
import 'registerfinalpage.dart';
import 'registerpage.dart';

class MyRegisterCameraPage extends StatefulWidget {
  final Data data;
  const MyRegisterCameraPage({Key key, this.data}) : super(key: key);

  @override
  _RegisterCameraState createState() => _RegisterCameraState();
}

class _RegisterCameraState extends State<MyRegisterCameraPage> {
  Color mycol = Color(0xFF5CA9F0);
  bool mypic = false;
  File _image;

  @override
  void initState() {
    super.initState();
  }

  Future setData() async {
    widget.data.image = _image;
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      if (_image == null) {
        navigateToRegisterPage(context);
      } else {
        setData();
        navigateToRegisterFinalPage(context, widget.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!mypic) {
      getImage();
      mypic = true;
    }

    return Scaffold(
      backgroundColor: mycol,
    );
    }
}

Future navigateToRegisterPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyRegisterPage()));
}

Future navigateToRegisterFinalPage(context, data) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => MyRegisterFinalPage(data)));
}
