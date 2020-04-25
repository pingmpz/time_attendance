import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'registerpage.dart';
import 'homepage.dart';

class MyRegisterCameraPage extends StatefulWidget {
  const MyRegisterCameraPage({Key key}) : super(key: key);

  @override
  _RegisterCameraState createState() => _RegisterCameraState();
}

class _RegisterCameraState extends State<MyRegisterCameraPage> {
  Color mycol = Color(0xFF5CA9F0);
  bool mypic = false;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      if (_image == null) {
        navigateToRegisterPage(context);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 800,
                    child: _image == null ? SizedBox(width: 10) : Image.file(_image)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ButtonTheme(
                      minWidth: 330,
                      height: 80,
                      child: RaisedButton(
                        onPressed: () {
                          navigateToHomePage(context);
                        },
                        color: Colors.green,
                        elevation: 0.0,
                        child: const Text('Finish',
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontFamily: 'Raleway')),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(45.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    ButtonTheme(
                      minWidth: 330,
                      height: 80,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            mypic = false;
                          });
                        },
                        color: Colors.deepOrange,
                        elevation: 0.0,
                        child: const Text('Retake',
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontFamily: 'Raleway')),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(45.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future navigateToHomePage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyHomePage()));
}

Future navigateToRegisterPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyRegisterPage()));
}
