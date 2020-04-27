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
  File image;

  @override
  void initState() {
    super.initState();
  }

  Future setData() async {
    widget.data.image = image;
  }

  Future getImage() async {
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = pic;
      if (image == null) {
        navigateToRegisterPage(context, widget.data);
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

Future navigateToRegisterPage(context, data) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyRegisterPage(data: data)));
}

Future navigateToRegisterFinalPage(context, data) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => MyRegisterFinalPage(data)));
}
